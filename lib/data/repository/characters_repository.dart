import 'package:breaking_bad_app/data/api_services/characters_service.dart';
import 'package:breaking_bad_app/data/model/character.dart';

class CharactersRepository {
  final CharachtersService charactersService;

  CharactersRepository(this.charactersService);
  Future<List<Character>> getAllCharacters() async {
    final cah = await charactersService.getAllCharacters();
    // print("ccccccccccccc${cah.length}");
    return cah;
  }
}
