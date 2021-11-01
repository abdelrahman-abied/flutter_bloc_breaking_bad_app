import 'dart:convert';

import 'package:breaking_bad_app/data/model/character.dart';
import 'package:breaking_bad_app/utils/constants.dart';
import 'package:dio/dio.dart';

class CharachtersService {
  late Dio dio;
  CharachtersService() {
    BaseOptions options = BaseOptions(
      baseUrl: Constants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

  Future<List<Character>> getAllCharacters() async {
    try {
      final Response response = await dio.get(
        "characters",
      );

      if (response.statusCode == 200) {
        return characterFromJson(response.data);
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
