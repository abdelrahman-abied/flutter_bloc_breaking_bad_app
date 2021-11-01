import 'package:breaking_bad_app/data/model/character.dart';
import 'package:breaking_bad_app/utils/style.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(size),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 20),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo("name : ", character.name!),
                      dividerBuilder(size.width),
                      characterInfo(
                          "job : ", character.occupation!.join(" / ")),
                      dividerBuilder(size.width),
                      characterInfo(
                          "appeared in : ", character.category!.toString()),
                      dividerBuilder(size.width),
                      characterInfo(
                          "portrayed : ", character.portrayed!.toString()),
                      dividerBuilder(size.width),
                      characterInfo(
                          "Birthday : ", character.birthday.toString()),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(Size size) {
    return SliverAppBar(
      expandedHeight: size.height - 100,
      stretch: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          "${character.nickname}",
          style: const TextStyle(
            color: accentColor,
          ),
        ),
        background: Hero(
          tag: character.charId!,
          child: Image.network(
            character.img.toString(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: accentColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: accentColor,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget dividerBuilder(double dividerLength) {
    return Divider(
      color: secondaryColor,
      height: 30,
      thickness: 3,
      // endIndent: dividerLength,
    );
  }
}
