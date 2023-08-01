import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/ui/character_detail/screen_character_detail.dart';
import 'package:rick_and_morty/ui/characters/screen_characters.dart';
import 'package:rick_and_morty/ui/characters_favorites/screen_characters_favorites.dart';

enum AppScreens {
  characters("screen_character"),
  charactersFavorite("screen_characters_favorite"),
  characterDetail("screen_character_detail"),
  characterDetail2("screen_character_detail2");

  final String name;
  const AppScreens(this.name);
}

final router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        name: AppScreens.characters.name,
        builder: (context, state) => const ScreenCharacters(),
        routes: [
          GoRoute(
            path: 'detail/:id_character',
            name: AppScreens.characterDetail.name,
            builder: (context, state) {
              final int characterId = int.parse(state.pathParameters['id_character']!);
              return ScreenCharacterDetail(idCharacter: characterId);
            }
          ),
          GoRoute(
              path: 'favorites',
              name: AppScreens.charactersFavorite.name,
              builder: (context, state) => const ScreenCharactersFavorites(),
              routes: [
                GoRoute(
                    path: 'detail2/:id_character',
                    name: AppScreens.characterDetail2.name,
                    builder: (context, state) {
                      final int characterId = int.parse(state.pathParameters['id_character']!);
                      return ScreenCharacterDetail(idCharacter: characterId);
                    }
                )
              ]
          ),
      ]
    ),
  ]
);
