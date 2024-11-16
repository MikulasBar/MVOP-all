// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [InputScreen]
class InputRoute extends PageRouteInfo<void> {
  const InputRoute({List<PageRouteInfo>? children})
      : super(
          InputRoute.name,
          initialChildren: children,
        );

  static const String name = 'InputRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InputScreen();
    },
  );
}

/// generated route for
/// [OutputScreen]
class OutputRoute extends PageRouteInfo<OutputRouteArgs> {
  OutputRoute({
    Key? key,
    required String satelliteId,
    required bool visible,
    List<PageRouteInfo>? children,
  }) : super(
          OutputRoute.name,
          args: OutputRouteArgs(
            key: key,
            satelliteId: satelliteId,
            visible: visible,
          ),
          initialChildren: children,
        );

  static const String name = 'OutputRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OutputRouteArgs>();
      return OutputScreen(
        key: args.key,
        satelliteId: args.satelliteId,
        visible: args.visible,
      );
    },
  );
}

class OutputRouteArgs {
  const OutputRouteArgs({
    this.key,
    required this.satelliteId,
    required this.visible,
  });

  final Key? key;

  final String satelliteId;

  final bool visible;

  @override
  String toString() {
    return 'OutputRouteArgs{key: $key, satelliteId: $satelliteId, visible: $visible}';
  }
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WelcomeScreen();
    },
  );
}
