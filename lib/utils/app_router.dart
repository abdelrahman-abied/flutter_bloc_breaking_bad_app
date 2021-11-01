import 'package:breaking_bad_app/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad_app/data/api_services/characters_service.dart';
import 'package:breaking_bad_app/data/model/character.dart';
import 'package:breaking_bad_app/data/repository/characters_repository.dart';
import 'package:breaking_bad_app/screens/character_details.dart';
import 'package:breaking_bad_app/screens/characters.dart';
import 'package:breaking_bad_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository _charactersRepository;
  late CharactersCubit _characterCubit;

  AppRouter() {
    _charactersRepository = CharactersRepository(CharachtersService());
    _characterCubit = CharactersCubit(_charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => _characterCubit,
            child: CharactersScreen(),
          ),
        );
      case Constants.characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(character: character));
    }
  }
}
