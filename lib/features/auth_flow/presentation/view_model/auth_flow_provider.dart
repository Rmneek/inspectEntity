import 'package:inspect_connect/core/basecomponents/base_view_model.dart';
import 'package:inspect_connect/features/auth_flow/domain/enums/auth_user_enum.dart';

class AuthFlowViewModel extends BaseViewModel {
  AuthUserType? _flow;

  AuthUserType? get flow => _flow;

  bool get isClient => _flow == AuthUserType.client;
  bool get isInspector => _flow == AuthUserType.inspector;

  void setClient() {
    _flow = AuthUserType.client;
    notifyListeners();
  }

  void setInspector() {
    _flow = AuthUserType.inspector;
    notifyListeners();
  }

  void reset() {
    _flow = null;
    notifyListeners();
  }
}
