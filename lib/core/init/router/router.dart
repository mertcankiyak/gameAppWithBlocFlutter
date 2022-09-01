import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../feature/detail/view/detail_view.dart';
import '../../../feature/game/model/data_model.dart';
import '../../../feature/game/view/game_view.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: GameView, initial: true),
    AutoRoute(page: DetailView),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}