import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:inspect_connect/core/basecomponents/base_view_model.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/auto_router.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/navigation_service.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:inspect_connect/core/utils/constants/app_text_editing_controllers.dart';
import 'package:inspect_connect/features/auth_flow/domain/enums/auth_targer_enum.dart';
import 'package:inspect_connect/features/auth_flow/domain/enums/client_sign_up_step_enum.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/auth_flow_provider.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/client_view_model_services/client_forgot_password_service.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/client_view_model_services/client_otp_service.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/client_view_model_services/client_sign_in_service.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/client_view_model_services/client_sign_up_service.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';

class ClientViewModelProvider extends BaseViewModel {
  final NavigationService navService;
  final AuthFlowViewModel authFlow;

  ClientViewModelProvider(this.navService, this.authFlow) {
    signInService = ClientSignInService(this);
    signUpService = ClientSignUpService(this);
    otpService = ClientOtpService(this);
    forgotPasswordService = ClientForgotPasswordService(this);
  }

  late final ClientSignInService signInService;
  late final ClientSignUpService signUpService;
  late final ClientOtpService otpService;
  late final ClientForgotPasswordService forgotPasswordService;
  bool loginAutoValidate = false;
  bool signup1AutoValidate = false;
  bool signup2AutoValidate = false;

  bool forgotAutoValidate = false;
  void enableLoginAutoValidate() {
    loginAutoValidate = true;
    notifyListeners();
  }

  void enableSignup1AutoValidate() {
    signup1AutoValidate = true;
    notifyListeners();
  }

  void enableSignup2AutoValidate() {
    signup2AutoValidate = true;
    notifyListeners();
  }

  void enableForgotAutoValidate() {
    forgotAutoValidate = true;
    notifyListeners();
  }

  bool obscurePassword = true;
  bool obscureConfirm = true;

  void togglePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleConfirm() {
    obscureConfirm = !obscureConfirm;
    notifyListeners();
  }

  String? validateSignINPassword(String? v) {
    if (v == null || v.isEmpty) return passwordRequiredError;
    return null;
  }

  @override
  void dispose() {
    _timer?.cancel();
    pinController.dispose();
    super.dispose();
  }

  bool _obscure = true;
  bool get obscure => _obscure;
  bool _isSigningIn = false;
  bool get isSigningIn => _isSigningIn;
  String fcmToken = '';
  ClientSignUpStepEnum _currentStep = ClientSignUpStepEnum.clientSignUpStep1;

  ClientSignUpStepEnum get currentStep => _currentStep;
  final focusNode = FocusNode();

  static const int codeLength = 6;
  static const int resendCooldownSec = 30;

  int _secondsLeft = resendCooldownSec;
  int get secondsLeft => _secondsLeft;

  bool get canVerify => pinController.text.trim().length == codeLength;
  bool get canResend => _secondsLeft == 0;

  Timer? _timer;

  bool _lastCanVerify = false;
  Map<String, dynamic>? addressData;
  String? _phoneIso;
  String? _phoneDialCode;
  String? _phoneRaw;
  String? _phoneE164;
  String? get phoneRaw => _phoneRaw;
  String? get phoneE164 => _phoneE164;

  String? get phoneIso => _phoneIso;
  String? get phoneDialCode => _phoneDialCode;

  void onPhoneChanged(PhoneNumber phone) {
    _phoneIso = phone.countryISOCode;
    _phoneDialCode = phone.countryCode;
    _phoneRaw = phone.number;
    _phoneE164 = phone.completeNumber;
  }

  void onCountryChanged(Country country) {
    _phoneIso = country.code;
    _phoneDialCode = '+${country.dialCode}';
    _phoneE164 = (_phoneRaw?.isNotEmpty ?? false)
        ? '+${country.dialCode}${_phoneRaw!}'
        : '';
  }

  void setAddressData(Map<String, dynamic> data) {
    addressData = data;
  }

  void goToStep2() {
    _currentStep = ClientSignUpStepEnum.clientSignUpStep2;
    notifyListeners();
  }

  void setSigningIn(bool value) {
    _isSigningIn = value;
    notifyListeners();
  }

  void toggleObscure() {
    _obscure = !_obscure;
    notifyListeners();
  }

  void verifyInit() {
    startCooldown();
    pinController.addListener(() {
      final now = canVerify;
      if (now != _lastCanVerify) {
        _lastCanVerify = now;
        notifyListeners();
      }
    });
  }

  void startCooldown() {
    _secondsLeft = resendCooldownSec;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsLeft <= 0) {
        t.cancel();
      } else {
        _secondsLeft--;
      }
      notifyListeners();
    });
    notifyListeners();
  }

  String? validateRequired(String? v) =>
      (v == null || v.trim().isEmpty) ? fieldRequiredError : null;

  String? validateEmail(String? v) {
    if (v == null || v.trim().isEmpty) return 'Email is required';

    final email = v.trim();
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    return regex.hasMatch(email) ? null : 'Enter a valid email';
  }

  String? validatePhone() {
    if (!signup1AutoValidate) return null;
    if (_phoneE164 == null || _phoneE164!.isEmpty) {
      return phoneRequiredError;
    }
    if ((_phoneRaw ?? '').length < 10) {
      return phoneInvalidError;
    }
    return null;
  }

  String? validateSignUpPassword(String? value) {
    if (value == null || value.isEmpty) return passwordRequiredError;
    if (value.length < 6) return minimumSixCharactersRequired;
    final regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$',
    );
    if (!regex.hasMatch(value)) {
      return includeUpperLowerNumberSymbol;
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (!signup2AutoValidate) return null;
    if (value == null || value.isEmpty) {
      return confirmPasswordRequiredError;
    }
    if (value != cltPasswordCtrlSignUp.text) {
      return passwordMismatchError;
    }
    return null;
  }

  String? validateMailingAddress(String? value) {
    if (value == null || value.isEmpty) return 'Please enter mailing address';
    if (value.length < 6) return 'Please enter address of atleast 6 characters';

    return null;
  }

  Future<void> signIn({required GlobalKey<FormState> formKey}) async {
    log('--tapped--model->. signIn');
    signInService.signIn(formKey: formKey);
  }

  void switchAuth({required AuthTarget target}) {
    clearAuthControllers();

    if (authFlow.isClient) {
      _clientAuth(target);
    } else {
      _inspectorAuth(target);
    }
  }

  void _clientAuth(AuthTarget target) {
    if (target == AuthTarget.signIn) {
      navService.navigateAuth(ClientSignInRoute(showBackButton: false));
    } else {
      navService.navigateAuth(ClientSignUpStep1Route(showBackButton: false));
    }
  }

  void _inspectorAuth(AuthTarget target) {
    if (target == AuthTarget.signUp) {
      navService.navigateAuth(InspectorSignUpRoute(showBackButton: false));
    } else {
      navService.navigateAuth(ClientSignInRoute(showBackButton: false));
    }
  }

  Future<void> submitStep1({required GlobalKey<FormState> formKey}) async {
    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      enableSignup1AutoValidate();
      return;
    }

    goToStep2();

    navService.push(ClientSignUpStep2Route(showBackButton: true));
  }

  Future<void> submitStep2({required GlobalKey<FormState> formKey}) async {
    enableSignup2AutoValidate();

    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      enableSignup2AutoValidate();
      return;
    }

    setSigningIn(true);
    notifyListeners();

    try {
      signUpService.signUp(formKey: formKey);
    } finally {
      setSigningIn(false);

      notifyListeners();
    }
  }

  void clearAuthControllers() {
    cltEmailCtrl.clear();
    cltPasswordCtrl.clear();
    cltEmailCtrlSignUp.clear();
    cltPhoneCtrl.clear();
    cltFullNameCtrl.clear();
    cltPasswordCtrlSignUp.clear();
    cltConfirmPasswordCtrl.clear();
    cltResetEmailCtrl.clear();
    loginAutoValidate = false;
    signup1AutoValidate = false;
    signup2AutoValidate = false;
    forgotAutoValidate = false;
    notifyListeners();
  }

  Future<void> requestPasswordReset({
    required GlobalKey<FormState> formKey,
  }) async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    try {} finally {
      notifyListeners();
    }
  }

  Future<void> resend() async {
    if (!canResend) return;
    setSigningIn(true);
  }

  Future<void> verify() async {
    if (!canVerify) return;
    setSigningIn(true);
  }
}
