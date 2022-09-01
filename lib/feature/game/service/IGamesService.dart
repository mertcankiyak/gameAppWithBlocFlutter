import 'package:dio/dio.dart';
import 'package:game_with_bloc/core/init/base/network_manager.dart';
import 'package:game_with_bloc/feature/game/model/data_model.dart';

abstract class IGamesService {
  final Dio dio;
  Future<List<DataModel>?> getGamesData();
  IGamesService(this.dio);
}
