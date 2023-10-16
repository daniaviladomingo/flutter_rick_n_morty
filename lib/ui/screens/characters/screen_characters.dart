import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../common/management_resource_ui_state_widget.dart';
import '../../../navigation.dart';
import '../../common/util/flutter_extension_methods.dart';
import 'bloc/characters_bloc.dart';


class ScreenCharacters extends StatelessWidget {
  const ScreenCharacters({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(create: (_) => getIt<CharactersBloc>()..add(const CharactersEvent.init()), child: const ViewCharacters());
}

class ViewCharacters extends StatelessWidget {
  const ViewCharacters({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.inversePrimary,
        title: Text(context.string.rickAndMorty),
        actions: [
          IconButton(
            onPressed: () => context.goNamed(AppScreens.charactersFavorite.name),
            icon: const Icon(Icons.favorite_rounded),
          ),
        ],
      ),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          return ManagementResourceUiStateWidget(
            state: state.characters,
            successView: (characters) => ListView.builder(
              itemCount: characters.length,
              itemBuilder: (BuildContext context, int index) {
                final character = characters[index];
                return GestureDetector(
                  onTap: () => context.goNamed(AppScreens.characterDetail.name, pathParameters: {'id_character': character.id.toString()}),
                  child: ViewCharacter(character: character),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ViewCharacter extends StatelessWidget {
  final CharacterEntity character;

  const ViewCharacter({super.key, required this.character});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
            height: context.mediaQuery.size.width / 2,
            margin: const EdgeInsetsDirectional.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Hero(
                tag: character.image,
                child: CachedNetworkImage(
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  imageUrl: character.image,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(character.name),
          ),
        ],
      );
}
