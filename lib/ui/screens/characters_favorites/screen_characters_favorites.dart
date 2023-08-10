import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/di/service_locator.dart';
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/ui/common/management_base_ui_state_widget.dart';
import 'package:rick_and_morty/ui/navigation.dart';
import 'package:rick_and_morty/ui/screens/characters/screen_characters.dart';
import 'package:rick_and_morty/ui/screens/characters_favorites/bloc/characters_favorites_bloc.dart';

class ScreenCharactersFavorites extends StatelessWidget {
  const ScreenCharactersFavorites({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider(
          create: (_) => getIt<CharactersFavoritesBloc>()..add(const CharactersFavoritesEvent.init()),
          child: const ViewCharactersFavorites()
      );
}

class ViewCharactersFavorites extends StatelessWidget {
  const ViewCharactersFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(S.of(context).characterFavorites),
        ),
        body: BlocBuilder<CharactersFavoritesBloc, CharactersFavoritesState>(
          builder: (context, state) {
            return ManagementBaseUiStateWidget(
              state: state.characters,
              successView: (characters) => ListView.builder(
                itemCount: characters.length,
                itemBuilder: (BuildContext context, int index) {
                  final character = characters[index];
                  return GestureDetector(
                      onTap: () => context.goNamed(AppScreens.characterDetailFromFavorites.name, pathParameters: {'id_character': character.id.toString()}),
                      child: ViewCharacter(character: character));
                },
              ),
              retry: () {},
            );
          },
        )
    );
  }
}