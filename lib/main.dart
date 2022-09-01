import 'package:flutter/material.dart';
import 'package:game_with_bloc/core/init/base/network_manager.dart';
import 'package:game_with_bloc/core/init/router/router.dart';

import 'package:game_with_bloc/feature/game/service/games_service.dart';
import 'feature/game/model/data_model.dart';
import 'feature/game/view/game_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
