// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    GameViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const GameView());
    },
    DetailViewRoute.name: (routeData) {
      final args = routeData.argsAs<DetailViewRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: DetailView(key: args.key, dataModel: args.dataModel));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(GameViewRoute.name, path: '/'),
        RouteConfig(DetailViewRoute.name, path: '/detail-view')
      ];
}

/// generated route for
/// [GameView]
class GameViewRoute extends PageRouteInfo<void> {
  const GameViewRoute() : super(GameViewRoute.name, path: '/');

  static const String name = 'GameViewRoute';
}

/// generated route for
/// [DetailView]
class DetailViewRoute extends PageRouteInfo<DetailViewRouteArgs> {
  DetailViewRoute({Key? key, required DataModel? dataModel})
      : super(DetailViewRoute.name,
            path: '/detail-view',
            args: DetailViewRouteArgs(key: key, dataModel: dataModel));

  static const String name = 'DetailViewRoute';
}

class DetailViewRouteArgs {
  const DetailViewRouteArgs({this.key, required this.dataModel});

  final Key? key;

  final DataModel? dataModel;

  @override
  String toString() {
    return 'DetailViewRouteArgs{key: $key, dataModel: $dataModel}';
  }
}
