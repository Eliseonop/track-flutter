// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
// import 'package:trackservice/auth/service/auth_service.dart';
// import 'package:trackservice/screens/home/home_screen.dart';
// import 'package:trackservice/screens/login/login_screen.dart';
// import 'package:trackservice/screens/welcome/welcome_screen.dart';

// class AppRouter {
//   late final GoRouter router;

//   AppRouter() {
//     router = GoRouter(
//       routes: <GoRoute>[
//         GoRoute(
//           path: '/',
//           builder: (context, state) => const WelcomeScreen(),
//         ),
//         GoRoute(
//           path: '/home',
//           builder: (context, state) => const HomeScreen(),
//         ),
//         // GoRoute(
//         //   path: '/login',
//         //   builder: (context, state) =>  LoginScreen(),
//         // ),
//       ],
//       redirect: (BuildContext context, GoRouterState state) {
//         final authService = Provider.of<AuthService>(context, listen: true);
//         print(authService.user);
//         print(authService.isAuthenticated());
//         if (!authService.isAuthenticated()) {
//           return '/';
//         } else {
//           return '/home';
//         }
//       },
//     );
//   }
// }
