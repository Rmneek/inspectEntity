
// UI = animations & rendering only
// ✔ Logic = ViewModel (extends BaseViewModel)
// ✔ Widgets split into reusable components
// ✔ Route-scoped Provider
// ✔ No extra system load
// ✔ Easy to scale & test

// 📁 FINAL FOLDER STRUCTURE
// features/
// └─ onboarding/
//    ├─ presentation/
//    │  ├─ pages/
//    │  │  └─ onboarding_page.dart
//    │  ├─ widgets/
//    │  │  ├─ onboarding_video_background.dart
//    │  │  ├─ onboarding_toggle.dart
//    │  │  └─ onboarding_actions.dart
//    │  └─ view_model/
//    │     └─ onboarding_view_model.dart

// 1️⃣ ViewModel (ALL LOGIC HERE)
// onboarding_view_model.dart
// import 'package:flutter/material.dart';
// import 'package:inspect_connect/core/basecomponents/base_view_model.dart';
// import 'package:inspect_connect/features/auth_flow/enum/auth_user_enum.dart';
// import 'package:inspect_connect/features/auth_flow/presentation/auth_user_provider.dart';
// import 'package:inspect_connect/core/utils/auto_router_setup/auto_router.dart';

// class OnBoardingViewModel extends BaseViewModel {
//   final AuthFlowProvider _authFlowProvider;

//   OnBoardingViewModel(this._authFlowProvider);

  




//   String get headline {
//     if (_isClient == true) {
//       return "Connecting Quality Inspections\nwith Quality Projects\nfor Every Build that Matters";
//     }
//     if (_isClient == false) {
//       return "Join a Trusted Network\nof Inspectors Connecting\nyou with Quality Opportunities";
//     }
//     return "Welcome to Inspect Connect - \nWhere Projects and Inspectors\nMeet to Build Better Together";
//   }

  

  


// ✅ Uses BaseViewModel
// ✅ Only calls notifyListeners() when UI must update
// ✅ Navigation isolated
// ✅ Zero animation logic

// 2️⃣ Route + Provider (Clean & Scoped)
// onboarding_page.dart
// @RoutePage()
// class OnBoardingPage extends StatelessWidget implements AutoRouteWrapper {
//   const OnBoardingPage({super.key});

//   @override
//   Widget wrappedRoute(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => locator<OnBoardingViewModel>(),
//       child: const _OnBoardingUI(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) => const _OnBoardingUI();
// }

// 3️⃣ UI PAGE (No Logic)
// _OnBoardingUI

// 4️⃣ Widgets (Pure UI Components)
// onboarding_video_background.dart

// onboarding_toggle.dart

// onboarding_actions.dart

// ✅ FINAL CLEAN ARCHITECTURE CHECKLIST
// Rule	Status
// UI only renders	✅
// Logic in ViewModel	✅
// BaseViewModel reused	✅
// Route-scoped provider	✅
// Widgets reusable	✅
// Low system load	✅
// Production ready	🚀
// 🧠 Senior Insight

// This structure is exactly how scalable Flutter apps are written:

// ViewModel = orchestration

// Widgets = dumb & reusable

// Providers = lifecycle

// No over-engineering

// If you want next:

// Convert Video logic to mixin

// Create BasePage<T extends BaseViewModel>