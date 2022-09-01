import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:game_with_bloc/feature/game/service/games_service.dart';
import 'package:game_with_bloc/feature/game/viewmodel/bloc/game_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../core/init/base/network_manager.dart';
import '../../../core/init/router/router.dart';
import '../../../product/constant/string_constant.dart';
import '../model/data_model.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameBloc(gamesService: GamesService(NetworkManager.instance.dio)),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<GameBloc, GameState>(
            builder: (context, state) {
              if (state is GameInitialState) {
                context.read<GameBloc>().add(LoadGameDataEvent());
                return const CircularProgressIndicator();
              } else if (state is GameLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is GameLoadedState) {
                return buildGameModel(state.apiResult);
              } else {
                return Text(StringConstants.error);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildGameModel(List<DataModel?> apiResult) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: apiResult.length,
      itemBuilder: (BuildContext context, int index) {
        final DataModel? dataModel = apiResult[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
          child: InkWell(
            onTap: () {
              context.router.push(DetailViewRoute(dataModel: dataModel));
            },
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      height: context.dynamicWidth(0.6),
                      width: MediaQuery.of(context).size.width / 1.05,
                      fit: BoxFit.cover,
                      image: NetworkImage(dataModel?.image ?? ""),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: GlassmorphicContainer(
                      width: MediaQuery.of(context).size.width / 1.05,
                      height: context.dynamicWidth(0.3),
                      border: 0,
                      borderRadius: 0,
                      blur: 20,
                      alignment: Alignment.bottomCenter,
                      linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.1),
                          const Color(0xFFFFFFFF).withOpacity(0.05),
                        ],
                        stops: const [
                          0.1,
                          1,
                        ],
                      ),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.5),
                          const Color((0xFFFFFFFF)).withOpacity(0.5),
                        ],
                      ),
                      child: Padding(
                        padding: context.paddingLow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                dataModel?.title ?? "",
                                style: context.textTheme.headline6,
                              ),
                            ),
                            SizedBox(
                              height: context.dynamicWidth(0.03),
                            ),
                            Text(
                              "${StringConstants.platforms} ${dataModel?.platforms}",
                              style: context.textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
