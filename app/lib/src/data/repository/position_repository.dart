import 'package:app/src/utils/custom_error.dart';
import 'package:dio/dio.dart';

import '../../constants/constants.dart';
import '../models/position.dart';

class PositionRepository {
  Future<List<Position>> init(int level) async {
    try {
      Response res = await Dio().get<dynamic>('$positionUrl/$level/init');
      List<Position> positions = (res.data as List)
          .map<Position>(
              (dynamic json) => Position.fromJson(json as Map<String, dynamic>))
          .toList();
      return positions;
    } catch (err) {
      throw CustomDioError(message: 'PositionRepository.init()');
    }
  }

  Future<Position> get(int level) async {
    try {
      Response res = await Dio().get<dynamic>('$positionUrl/$level');
      Position position = Position.fromJson(res.data as Map<String, dynamic>);
      return position;
    } catch (err) {
      throw CustomDioError(message: 'PositionRepository.get()');
    }
  }
}
