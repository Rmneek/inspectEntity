import 'package:auto_route/auto_route.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/auto_router.dart';

class NavigationService {
  final AppRouter _router;

  NavigationService(this._router);

  void replace(PageRouteInfo route) {
    _router.replace(route);
  }

    void replaceRoute(PageRouteInfo route) {
    _router.replaceAll([route]);
  }

  void push(PageRouteInfo route) {
    _router.push(route);
  }

  void pop<T extends Object?>([T? result]) {
    _router.pop(result);
  }

   void navigateAuth(PageRouteInfo route) {
    final existing = _router.stack
        .map((e) => e.name)
        .toList();

    if (existing.contains(route.routeName)) {
      _router.replaceAll([route]);
    } else {
      _router.push(route);
    }
  }
}
