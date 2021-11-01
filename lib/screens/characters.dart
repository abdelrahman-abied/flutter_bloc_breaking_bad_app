import 'package:breaking_bad_app/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad_app/data/model/character.dart';
import 'package:breaking_bad_app/shared/character_item.dart';
import 'package:breaking_bad_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  CharactersScreen({Key? key}) : super(key: key);

  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> _allCharacters;
  late List<Character> _searchedCharacters;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context, listen: false).getAllCharacters();
  }

  Widget _buildSearch() {
    return TextField(
      controller: _searchController,
      cursorColor: primaryColor,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Find a charachter',
        hintStyle: TextStyle(fontSize: 18, color: secondaryColor),
      ),
      style: TextStyle(fontSize: 18, color: secondaryColor),
      onChanged: (searchedCharacter) {
        searchForItemInList(searchedCharacter);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(
        //   color: secondaryColor, //change your color here
        // ),
        backgroundColor: primaryColor,
        title: _isSearching ? _buildSearch() : _buildAppbarTitle(),
        actions: _buildSearchAppBar(),
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            print(state.characters.length);
            _allCharacters = state.characters;
            return buildLoadedCharacters();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  List<Widget> _buildSearchAppBar() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _searchController.text.isNotEmpty
                ? _clearSearch()
                : Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: secondaryColor,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              _startSearch();
            },
            icon: const Icon(
              Icons.search,
              color: secondaryColor,
            ))
      ];
    }
  }

  _startSearch() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    _isSearching = true;
    setState(() {});
  }

  Widget buildLoadedCharacters() {
    return Container(
      color: primaryColor,
      height: double.infinity,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: _searchController.text.isEmpty
            ? _allCharacters.length
            : _searchedCharacters.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return CharacterItem(
            character: _searchController.text.isEmpty
                ? _allCharacters[index]
                : _searchedCharacters[index],
          );
        },
      ),
    );
  }

  void searchForItemInList(String searchedCharacter) {
    _searchedCharacters = _allCharacters
        .where((character) =>
            character.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  void _stopSearching() {
    _isSearching = false;
    _clearSearch();
    setState(() {});
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {});
  }

  _buildAppbarTitle() {
    return const Text(
      'Characters',
      style: TextStyle(
        color: secondaryColor,
      ),
    );
  }
}
