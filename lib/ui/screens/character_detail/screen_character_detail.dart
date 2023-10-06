import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/management_resource_ui_state_widget.dart';
import 'bloc/character_detail_bloc.dart';

class ScreenCharacterDetail extends StatelessWidget {
  final int idCharacter;

  const ScreenCharacterDetail({super.key, required this.idCharacter});

  @override
  Widget build(BuildContext context) => BlocProvider(create: (_) => getIt<CharacterDetailBloc>(param1: idCharacter)..add(const CharacterDetailEvent.init()), child: const ViewCharacterDetail());
}

class ViewCharacterDetail extends StatelessWidget {
  const ViewCharacterDetail({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: ManagementResourceUiStateWidget(
              state: state.characterDetail,
              successView: (character) => Text(character.name),
            ),
            actions: [
              ManagementResourceUiStateWidget(
                state: state.isFavorite,
                successView: (isFavorite) => IconButton(
                  onPressed: () => context.read<CharacterDetailBloc>().add(const CharacterDetailEvent.onFavoriteItemClick()),
                  icon: Icon(
                    isFavorite ? Icons.favorite_rounded : Icons.favorite_border,
                  ),
                ),
              ),
            ],
          ),
          body: Center(
            child: ManagementResourceUiStateWidget(
              state: state.characterDetail,
              successView: (character) => Hero(
                tag: character.image,
                child: CachedNetworkImage(
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  imageUrl: character.image,
                ),
              ),
            ),
          ),
        ),
      );
}
