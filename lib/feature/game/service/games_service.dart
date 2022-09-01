import 'dart:convert';

import 'package:game_with_bloc/feature/game/model/data_model.dart';
import 'package:game_with_bloc/feature/game/service/IGamesService.dart';

class GamesService extends IGamesService {
  GamesService(super.dio);

  @override
  Future<List<DataModel>?> getGamesData() async {
    final response = await dio.get("/giveaways");
    if (response.statusCode == 200) {
      try {
        final data = response.data;
        if (data is List) {
          return data.map((e) => DataModel.fromJson(e)).toList();
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
