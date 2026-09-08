import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/login/presentation/bloc/login_bloc.dart';
import 'features/auth/login/presentation/pages/login_page.dart';
import 'features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'features/auth/signup/presentation/pages/signup_page.dart';
import 'features/home/presentation/home_page.dart';
import 'injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const CleanAuthApp());
}

class CleanAuthApp extends StatelessWidget {
  const CleanAuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feature Based Clean Architecture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (_) => BlocProvider(
          create: (_) => getIt<LoginBloc>(),
          child: const LoginPage(),
        ),
        '/signup': (_) => BlocProvider(
          create: (_) => getIt<SignupBloc>(),
          child: const SignupPage(),
        ),
        '/home': (_) => const HomePage(),
      },
    );
  }
}
