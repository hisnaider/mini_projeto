import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_projeto/class/state_manager.dart';
import 'package:mini_projeto/screens/empty/page.dart';
import 'package:mini_projeto/screens/homepage/page.dart';
import 'package:mini_projeto/screens/payslip/page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StateManager(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        navigationBarTheme: const NavigationBarThemeData(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          elevation: 25,
          shadowColor: Colors.black,
          indicatorColor: Colors.transparent,
          indicatorShape: null,
        ),
        scrollbarTheme: const ScrollbarThemeData(
          thumbColor: MaterialStatePropertyAll(Colors.red),
        ),
        textTheme: TextTheme(
            headlineLarge: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blue.shade700,
            ),
            headlineSmall: TextStyle(
              color: Colors.blue.shade700,
            ),
            bodyMedium: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.75)),
            bodyLarge: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.75)),
            titleMedium: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.75)),
            titleLarge: TextStyle(
                color: Colors.blue.shade700, fontWeight: FontWeight.w600),
            labelLarge: const TextStyle(
                color: Colors.black26, fontWeight: FontWeight.w700)),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade700,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          actionsIconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue.shade700,
          primary: Colors.blue.shade700,
          background: Colors.white,
          surface: const Color.fromRGBO(245, 245, 245, 1),
        ),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const Homepage(),
      routes: [
        GoRoute(
          path: "payslip",
          builder: (context, state) => const PayslipPage(),
        ),
        GoRoute(
          path: "empty",
          builder: (context, state) => const EmptyPage(),
        ),
      ],
    ),
  ],
);
