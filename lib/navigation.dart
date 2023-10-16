import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/ui/screens/character_detail/screen_character_detail.dart';
import 'package:rick_and_morty/ui/screens/characters/screen_characters.dart';
import 'package:rick_and_morty/ui/screens/characters_favorites/screen_characters_favorites.dart';

enum AppScreens {
  characters("screen_character"),
  charactersFavorite("screen_characters_favorite"),
  characterDetail("character_detail");

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
          },
        ),
        GoRoute(
          path: 'favorites',
          name: AppScreens.charactersFavorite.name,
          builder: (context, state) => const ScreenCharactersFavorites(),
        ),
      ],
    ),
  ],
);
