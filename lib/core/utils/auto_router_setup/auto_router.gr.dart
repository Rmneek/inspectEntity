// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_router.dart';

/// generated route for
/// [ClientSignInView]
class ClientSignInRoute extends PageRouteInfo<ClientSignInRouteArgs> {
  ClientSignInRoute({
    Key? key,
    required bool showBackButton,
    List<PageRouteInfo>? children,
  }) : super(
         ClientSignInRoute.name,
         args: ClientSignInRouteArgs(key: key, showBackButton: showBackButton),
         initialChildren: children,
       );

  static const String name = 'ClientSignInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ClientSignInRouteArgs>();
      return ClientSignInView(
        key: args.key,
        showBackButton: args.showBackButton,
      );
    },
  );
}

class ClientSignInRouteArgs {
  const ClientSignInRouteArgs({this.key, required this.showBackButton});

  final Key? key;

  final bool showBackButton;

  @override
  String toString() {
    return 'ClientSignInRouteArgs{key: $key, showBackButton: $showBackButton}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ClientSignInRouteArgs) return false;
    return key == other.key && showBackButton == other.showBackButton;
  }

  @override
  int get hashCode => key.hashCode ^ showBackButton.hashCode;
}

/// generated route for
/// [ClientSignUpStep1View]
class ClientSignUpStep1Route extends PageRouteInfo<ClientSignUpStep1RouteArgs> {
  ClientSignUpStep1Route({
    Key? key,
    required bool showBackButton,
    List<PageRouteInfo>? children,
  }) : super(
         ClientSignUpStep1Route.name,
         args: ClientSignUpStep1RouteArgs(
           key: key,
           showBackButton: showBackButton,
         ),
         initialChildren: children,
       );

  static const String name = 'ClientSignUpStep1Route';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ClientSignUpStep1RouteArgs>();
      return ClientSignUpStep1View(
        key: args.key,
        showBackButton: args.showBackButton,
      );
    },
  );
}

class ClientSignUpStep1RouteArgs {
  const ClientSignUpStep1RouteArgs({this.key, required this.showBackButton});

  final Key? key;

  final bool showBackButton;

  @override
  String toString() {
    return 'ClientSignUpStep1RouteArgs{key: $key, showBackButton: $showBackButton}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ClientSignUpStep1RouteArgs) return false;
    return key == other.key && showBackButton == other.showBackButton;
  }

  @override
  int get hashCode => key.hashCode ^ showBackButton.hashCode;
}

/// generated route for
/// [ClientSignUpStep2View]
class ClientSignUpStep2Route extends PageRouteInfo<ClientSignUpStep2RouteArgs> {
  ClientSignUpStep2Route({
    Key? key,
    required bool showBackButton,
    List<PageRouteInfo>? children,
  }) : super(
         ClientSignUpStep2Route.name,
         args: ClientSignUpStep2RouteArgs(
           key: key,
           showBackButton: showBackButton,
         ),
         initialChildren: children,
       );

  static const String name = 'ClientSignUpStep2Route';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ClientSignUpStep2RouteArgs>();
      return ClientSignUpStep2View(
        key: args.key,
        showBackButton: args.showBackButton,
      );
    },
  );
}

class ClientSignUpStep2RouteArgs {
  const ClientSignUpStep2RouteArgs({this.key, required this.showBackButton});

  final Key? key;

  final bool showBackButton;

  @override
  String toString() {
    return 'ClientSignUpStep2RouteArgs{key: $key, showBackButton: $showBackButton}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ClientSignUpStep2RouteArgs) return false;
    return key == other.key && showBackButton == other.showBackButton;
  }

  @override
  int get hashCode => key.hashCode ^ showBackButton.hashCode;
}

/// generated route for
/// [ForgotpPasswordView]
class ForgotpPasswordRoute extends PageRouteInfo<ForgotpPasswordRouteArgs> {
  ForgotpPasswordRoute({
    Key? key,
    required bool showBackButton,
    List<PageRouteInfo>? children,
  }) : super(
         ForgotpPasswordRoute.name,
         args: ForgotpPasswordRouteArgs(
           key: key,
           showBackButton: showBackButton,
         ),
         initialChildren: children,
       );

  static const String name = 'ForgotpPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgotpPasswordRouteArgs>();
      return ForgotpPasswordView(
        key: args.key,
        showBackButton: args.showBackButton,
      );
    },
  );
}

class ForgotpPasswordRouteArgs {
  const ForgotpPasswordRouteArgs({this.key, required this.showBackButton});

  final Key? key;

  final bool showBackButton;

  @override
  String toString() {
    return 'ForgotpPasswordRouteArgs{key: $key, showBackButton: $showBackButton}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ForgotpPasswordRouteArgs) return false;
    return key == other.key && showBackButton == other.showBackButton;
  }

  @override
  int get hashCode => key.hashCode ^ showBackButton.hashCode;
}

/// generated route for
/// [InspectorSignUpView]
class InspectorSignUpRoute extends PageRouteInfo<InspectorSignUpRouteArgs> {
  InspectorSignUpRoute({
    Key? key,
    required bool showBackButton,
    List<PageRouteInfo>? children,
  }) : super(
         InspectorSignUpRoute.name,
         args: InspectorSignUpRouteArgs(
           key: key,
           showBackButton: showBackButton,
         ),
         initialChildren: children,
       );

  static const String name = 'InspectorSignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InspectorSignUpRouteArgs>();
      return InspectorSignUpView(
        key: args.key,
        showBackButton: args.showBackButton,
      );
    },
  );
}

class InspectorSignUpRouteArgs {
  const InspectorSignUpRouteArgs({this.key, required this.showBackButton});

  final Key? key;

  final bool showBackButton;

  @override
  String toString() {
    return 'InspectorSignUpRouteArgs{key: $key, showBackButton: $showBackButton}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! InspectorSignUpRouteArgs) return false;
    return key == other.key && showBackButton == other.showBackButton;
  }

  @override
  int get hashCode => key.hashCode ^ showBackButton.hashCode;
}

/// generated route for
/// [OnBoardingView]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute({List<PageRouteInfo>? children})
    : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const OnBoardingView());
    },
  );
}

/// generated route for
/// [OtpVerificationView]
class OtpVerificationRoute extends PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({
    Key? key,
    required bool addShowButton,
    bool showSignInText = true,
    List<PageRouteInfo>? children,
  }) : super(
         OtpVerificationRoute.name,
         args: OtpVerificationRouteArgs(
           key: key,
           addShowButton: addShowButton,
           showSignInText: showSignInText,
         ),
         initialChildren: children,
       );

  static const String name = 'OtpVerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpVerificationRouteArgs>();
      return OtpVerificationView(
        key: args.key,
        addShowButton: args.addShowButton,
        showSignInText: args.showSignInText,
      );
    },
  );
}

class OtpVerificationRouteArgs {
  const OtpVerificationRouteArgs({
    this.key,
    required this.addShowButton,
    this.showSignInText = true,
  });

  final Key? key;

  final bool addShowButton;

  final bool showSignInText;

  @override
  String toString() {
    return 'OtpVerificationRouteArgs{key: $key, addShowButton: $addShowButton, showSignInText: $showSignInText}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OtpVerificationRouteArgs) return false;
    return key == other.key &&
        addShowButton == other.addShowButton &&
        showSignInText == other.showSignInText;
  }

  @override
  int get hashCode =>
      key.hashCode ^ addShowButton.hashCode ^ showSignInText.hashCode;
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SplashView());
    },
  );
}
