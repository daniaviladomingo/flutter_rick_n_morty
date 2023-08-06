import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/di/service_locator.dart';
import 'package:rick_and_morty/ui/common/management_base_ui_state_widget.dart';
import 'package:rick_and_morty/ui/screens/character_detail/bloc/character_detail_bloc.dart';

class ScreenCharacterDetail extends StatelessWidget {
  final int idCharacter;

  const ScreenCharacterDetail({super.key, required this.idCharacter});

  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (_) => getIt<CharacterDetailBloc>(param1: idCharacter)..add(const CharacterDetailEvent.init()),
      child: const ViewCharacterDetail()
  );
}

class ViewCharacterDetail extends StatelessWidget {
  const ViewCharacterDetail({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
      builder: (context, state) => Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: ManagementBaseUiStateWidget(
                state: state.characterDetail,
                successView: (character) => Text(character.name),
                retry: () {},
              ),
              actions: [
                ManagementBaseUiStateWidget(
                  state: state.isFavorite,
                  successView: (isFavorite) =>
                      IconButton(
                          onPressed: () => context.read<CharacterDetailBloc>().add(const CharacterDetailEvent.onFavoriteItemClick()),
                          icon: Icon(isFavorite ? Icons.favorite_rounded : Icons.favorite_border)),
                  retry: (){},
                )
              ],
            ),
            body: Center(
                child: ManagementBaseUiStateWidget(
                    state: state.characterDetail,
                    successView: (character) => CachedNetworkImage(
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                          imageUrl: character.image,
                        ),
                    retry: () {})),
          ));
}
