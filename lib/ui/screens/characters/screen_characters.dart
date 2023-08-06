import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/di/service_locator.dart';
import 'package:rick_and_morty/domain/model/character.dart';
import 'package:rick_and_morty/ui/common/management_base_ui_state_widget.dart';
import 'package:rick_and_morty/ui/navigation.dart';
import 'package:rick_and_morty/ui/screens/characters/bloc/characters_bloc.dart';

class ScreenCharacters extends StatelessWidget {
  const ScreenCharacters({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider(
          create: (_) => getIt<CharactersBloc>()..add(const CharactersEvent.init()),
          child: const ViewCharacters()
      );
}

class ViewCharacters extends StatelessWidget {
  const ViewCharacters({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Rick & Morty Flutter'),
          actions: [
            IconButton(
                onPressed: () => context.goNamed(AppScreens.charactersFavorite.name),
                icon: const Icon(Icons.favorite_rounded)
            )
          ],
        ),
        body: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            return ManagementBaseUiStateWidget(
              state: state.characters,
              successView: (characters) => ListView.builder(
                itemCount: characters.length,
                itemBuilder: (BuildContext context, int index) {
                  final character = characters[index];
                  return GestureDetector(
                      onTap: () => context.goNamed(AppScreens.characterDetailFromCharacters.name, pathParameters: {'id_character': character.id.toString()}),
                      child: ViewCharacter(character: character));
                },
              ),
              retry: () {},
            );
          },
        ));
  }
}

class ViewCharacter extends StatelessWidget {
  final Character character;

  const ViewCharacter({super.key, required this.character});

  @override
  Widget build(BuildContext context) => Row(children: [
        Container(
            height: MediaQuery.of(context).size.width / 2,
            margin: const EdgeInsetsDirectional.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: CachedNetworkImage(
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                imageUrl: character.image,
              ),
            )),
        Expanded(child: Text(character.name))
      ]);
}
