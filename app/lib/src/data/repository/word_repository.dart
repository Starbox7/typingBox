import 'package:app/src/utils/custom_error.dart';
import 'package:dio/dio.dart';

import '../../constants/constants.dart';
import '../models/word.dart';

class WordRepository {
  Future<List<Word>> init() async {
    try {
      Response res = await Dio().get<dynamic>('$wordUrl/init');
      List<Word> words = (res.data as List)
          .map<Word>(
              (dynamic json) => Word.fromJson(json as Map<String, dynamic>))
          .toList();
      return words;
    } catch (err) {
      throw CustomDioError(message: 'WordRepository.init()');
    }
  }

  Future<Word> get() async {
    try {
      Response res = await Dio().get<dynamic>(wordUrl);
      Word word = Word.fromJson(res.data as Map<String, dynamic>);
      return word;
    } catch (err) {
      throw CustomDioError(message: 'WordRepository.get()');
    }
  }
}
