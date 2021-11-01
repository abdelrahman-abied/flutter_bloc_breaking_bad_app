import 'package:bloc/bloc.dart';
import 'package:breaking_bad_app/data/model/character.dart';
import 'package:breaking_bad_app/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'charachers_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository CharactersRepo;
  List<Character> characters = [];
  CharactersCubit(this.CharactersRepo) : super(CharactersInitial());
  List<Character> getAllCharacters() {
    CharactersRepo.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
