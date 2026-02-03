import 'dart:async';
import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inspect_connect/core/basecomponents/base_view_model.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/auto_router.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:inspect_connect/core/utils/constants/app_text_editing_controllers.dart';
import 'package:inspect_connect/features/auth_flow/data/services/auth_navigation_service.dart';
import 'package:inspect_connect/features/auth_flow/domain/enums/auth_targer_enum.dart';
import 'package:inspect_connect/features/auth_flow/domain/enums/client_sign_up_step_enum.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/auth_flow_provider.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/client_view_model_services/client_forgot_password_service.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/client_view_model_services/client_otp_service.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/client_view_model_services/client_sign_in_service.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/client_view_model_services/client_sign_up_service.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:provider/provider.dart';

class ClientViewModelProvider extends BaseViewModel {
  ClientViewModelProvider() {
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
    // return v.length < 6 ? 'Min 6 chars' : null;
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
    //  if (signup1AutoValidate) {
    //                             state.validate();
    //                           }
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

  // void reset() {
  //   signup1AutoValidate = false;
  //   signup2AutoValidate = false;

  //   _phoneIso = null;
  //   _phoneDialCode = null;
  //   _phoneRaw = null;
  //   _phoneE164 = null;
  //   addressData = null;
  //   setSigningIn(true);
  // }

  Future<void> signIn({
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) async {
    log('--tapped--model->. signIn');
    signInService.signIn(formKey: formKey, context: context);
  }

  void switchAuth({required BuildContext context, required AuthTarget target}) {
    clearAuthControllers();

    final router = context.router;
    final authFlow = context.read<AuthFlowProvider>();
    if (authFlow.isClient) {
      _clientAuth(router, target);
    } else {
      _inspectorAuth(router, target);
    }
  }

  void _clientAuth(StackRouter router, AuthTarget target) {
    if (target == AuthTarget.signIn) {
      AuthNavigationService.navigate(
        router: router,
        route: ClientSignInRoute(showBackButton: false),
        routeName: ClientSignInRoute.name,
      );
    } else {
      AuthNavigationService.navigate(
        router: router,
        route: ClientSignUpStep1Route(showBackButton: false),
        routeName: ClientSignUpStep1Route.name,
      );
    }
  }

  void _inspectorAuth(StackRouter router, AuthTarget target) {
    if (target == AuthTarget.signUp) {
      AuthNavigationService.navigate(
        router: router,
        route: InspectorSignUpRoute(showBackButton: false),
        routeName: InspectorSignUpRoute.name,
      );
    } else {
      AuthNavigationService.navigate(
        router: router,
        route: ClientSignInRoute(showBackButton: false),
        routeName: ClientSignInRoute.name,
      );
    }
  }

  Future<void> submitStep1({
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) async {
    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      enableSignup1AutoValidate();
      return;
    }

    goToStep2();

    context.router.push(ClientSignUpStep2Route(showBackButton: true));
  }

  Future<void> submitStep2({
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) async {
    enableSignup2AutoValidate();

    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      enableSignup2AutoValidate();
      return;
    }

    setSigningIn(true);
    notifyListeners();

    try {
      signUpService.signUp(formKey: formKey, context: context);
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
    required BuildContext context,
  }) async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    try {} finally {
      notifyListeners();
    }
  }

  Future<void> resend({required BuildContext context}) async {
    if (!canResend) return;
    setSigningIn(true);
    // try {
    //   final user = await locator<AuthLocalDataSource>().getUser();
    //   if (user == null || user.authToken == null) {
    //     throw Exception(userNotFoundInLocal);
    //   }
    //   final resendOtpUseCase = locator<ResendOtpUseCase>();
    //   final state = await executeParamsUseCase<AuthUser, ResendOtpParams>(
    //     useCase: resendOtpUseCase,
    //     query: ResendOtpParams(
    //       phoneNumber: user.phoneNumber ?? cltEmailCtrl.text.trim(),
    //       countryCode: user.countryCode ?? cltPasswordCtrl.text.trim(),
    //     ),
    //     launchLoader: true,
    //   );

    //   state?.when(
    //     data: (user) async {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(
    //           content: textWidget(
    //             text: 'Resend Otp successful',
    //             color: AppColors.backgroundColor,
    //           ),
    //         ),
    //       );

    //       pinController.clear();
    //       _startCooldown();
    //     },
    //     error: (e) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(
    //           content: textWidget(
    //             text: e.message ?? 'Sign-in failed',
    //             color: AppColors.backgroundColor,
    //           ),
    //         ),
    //       );
    //     },
    //   );
    // } finally {
    //   cltEmailCtrl.clear();
    //   cltPasswordCtrl.clear();
    //   setSigningIn(false);
    // }
  }

  Future<void> verify({required BuildContext context}) async {
    if (!canVerify) return;
    setSigningIn(true);
    // try {
    //   log('[VERIFY] Starting verification process...');

    //   final user = await locator<AuthLocalDataSource>().getUser();
    //   if (user == null) {
    //     log('[VERIFY] No local user found.');
    //     throw Exception(userNotFoundInLocal);
    //   }

    //   log(
    //     '[VERIFY] Found local user: id=${user.id}, token=${user.authToken}, phone=${user.phoneNumber}',
    //   );

    //   final verifyOtpUseCase = locator<OtpVerificarionUseCase>();
    //   final state = await executeParamsUseCase<AuthUser, OtpVerificationParams>(
    //     useCase: verifyOtpUseCase,
    //     query: OtpVerificationParams(
    //       phoneNumber: user.phoneNumber ?? cltEmailCtrl.text.trim(),
    //       countryCode: user.countryCode ?? cltPasswordCtrl.text.trim(),
    //       phoneOtp: pinController.text.trim(),
    //     ),
    //     launchLoader: true,
    //   );

    //   state?.when(
    //     data: (user) async {
    //       log(
    //         '[VERIFY]  OTP verification successful, received user from API:@$user',
    //       );
    //       log('  id=${user.id}');
    //       log('  iroled=${user.role}');

    //       log('  token=${user.authToken}');
    //       log('  name=${user.name}');
    //       log('  email=${user.emailHashed}');
    //       log('  phone=${user.phoneNumber}');

    //       final newUserLocal = user.toLocalEntity();
    //       final existingUser = await locator<AuthLocalDataSource>().getUser();

    //       log('[VERIFY] Existing local user before merge:');
    //       log('  id=${existingUser?.id}');
    //       log('  token=${existingUser?.authToken}');
    //       log('  name=${existingUser?.name}');
    //       log('  email=${existingUser?.email}');
    //       log('  phone=${existingUser?.phoneNumber}');

    //       final merged = existingUser != null
    //           ? existingUser.mergeWithNewData(newUserLocal)
    //           : newUserLocal;

    //       log('[VERIFY] Merged user before saving:');
    //       log('  id=${merged.id}');
    //       log('  token=${merged.authToken}');
    //       log('  name=${merged.name}');
    //       log('  email=${merged.email}');
    //       log('  phone=${merged.phoneNumber}');

    //       await locator<AuthLocalDataSource>().saveUser(merged);
    //       log('[VERIFY]  User saved locally after merge.');
    //       if (context.mounted) {
    //         await fetchUserDetail(user: user, context: context);
    //       }
    //       if (context.mounted) {
    //         ScaffoldMessenger.of(context).showSnackBar(
    //           SnackBar(
    //             content: textWidget(
    //               text: 'Sign-up successful',
    //               color: AppColors.backgroundColor,
    //             ),
    //           ),
    //         );
    //       }
    //       pinController.clear();
    //       if (user.role == 1) {
    //         if (context.mounted) {
    //           context.router.replaceAll([const ClientDashboardRoute()]);
    //         }
    //       } else {
    //         if (context.mounted) {
    //           context.router.replaceAll([const InspectorDashboardRoute()]);
    //         }
    //       }
    //     },
    //     error: (e) {
    //       log('[VERIFY] OTP verification failed: ${e.message}');
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(
    //           content: textWidget(
    //             text: e.message ?? 'Sign-up failed',
    //             color: AppColors.backgroundColor,
    //           ),
    //         ),
    //       );
    //     },
    //   );
    // } catch (e, s) {
    //   log('[VERIFY] Exception: $e');
    //   log('[VERIFY] Stacktrace: $s');
    // } finally {
    //   cltEmailCtrl.clear();
    //   cltPasswordCtrl.clear();
    //   setSigningIn(false);
    //   log('[VERIFY] Cleanup complete.');
    // }
  }
}
