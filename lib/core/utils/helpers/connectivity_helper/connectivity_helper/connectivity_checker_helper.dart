
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConnectivityCheckerHelper {
  Future<bool> checkConnectivity() async {
    final List<ConnectivityResult> results =
        await Connectivity().checkConnectivity();
    return _handleResults(results);
  }

  static Stream<List<ConnectivityResult>> listenToConnectivityChanged() {
    return Connectivity().onConnectivityChanged;
  }

  bool _handleResults(List<ConnectivityResult> results) {
    return results.contains(ConnectivityResult.mobile) ||
           results.contains(ConnectivityResult.wifi);
  }
}
