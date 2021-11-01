import 'package:breaking_bad_app/data/model/character.dart';
import 'package:breaking_bad_app/screens/character_details.dart';
import 'package:breaking_bad_app/utils/constants.dart';
import 'package:breaking_bad_app/utils/style.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  Character character;

  CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
            context, Constants.characterDetailsScreen,
            arguments: character),
        child: GridTile(
          child: Hero(
            tag: character.charId!,
            child: Container(
              color: primaryColor,
              child: character.img!.isNotEmpty
                  ? FadeInImage(
                      image: NetworkImage(character.img.toString()),
                      fit: BoxFit.cover,
                      placeholder: const NetworkImage(
                        "https://www.buytelegrammember.net/wp-content/uploads/2021/03/Telegram-load-image-1200x480.jpg",
                      ),
                    )
                  : Image.network(
                      "https://www.buytelegrammember.net/wp-content/uploads/2021/03/Telegram-load-image-1200x480.jpg"),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              character.name.toString(),
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: accentColor,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
