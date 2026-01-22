import 'package:auto_route/auto_route.dart';

class AuthNavigationService {
  static List<String> _stackNames(StackRouter router) {
    return RegExp(r'\"([^\"]+)\"')
        .allMatches(router.stack.toString())
        .map((m) => m.group(1))
        .whereType<String>()
        .toList();
  }

  static void navigate({
    required StackRouter router,
    required PageRouteInfo route,
    required String routeName,
    bool showBackButton = true,
  }) {
    final names = _stackNames(router);

    if (names.contains(routeName)) {
      router.replaceAll([route]);
    } else {
      router.push(route);
    }
  }
}
