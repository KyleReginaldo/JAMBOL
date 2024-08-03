import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jumbled/common/theme.dart';
import 'package:jumbled/data/model/product_model.dart';
import 'package:jumbled/dependency.dart';
import 'package:jumbled/firebase_options.dart';
import 'package:jumbled/presentation/screen/auth/login_screen.dart';
import 'package:jumbled/presentation/screen/auth/register_screen.dart';
import 'package:jumbled/presentation/screen/extension/product_detail_screen.dart';
import 'package:jumbled/presentation/screen/main_screen.dart';
import 'package:jumbled/presentation/state/auth/auth_cubit.dart';
import 'package:jumbled/presentation/state/category/category_cubit.dart';
import 'package:jumbled/presentation/state/product/product_cubit.dart';

import 'presentation/state/product/product_detail/product_detail_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = GoRouter(
    initialLocation: '/',
    redirect: (BuildContext context, GoRouterState state) async {
      if (context.read<AuthCubit>().state is LoggedIn) {
        context.read<AuthCubit>().reset();
        return '/';
      } else {
        return null;
      }
    },
    routes: [
      GoRoute(
          name:
              'main', // Optional, add name to your routes. Allows you navigate by name instead of path
          path: '/',
          builder: (context, state) => const MainScreen(),
          routes: [
            GoRoute(
              name:
                  'login', // Optional, add name to your routes. Allows you navigate by name instead of path
              path: 'login',
              builder: (context, state) => const LoginScreen(),
            ),
            GoRoute(
              name:
                  'register', // Optional, add name to your routes. Allows you navigate by name instead of path
              path: 'register',
              builder: (context, state) => const RegisterScreen(),
            ),
            GoRoute(
              name: 'product-detail',
              path: 'product-detail/:productId',
              builder: (context, state) => ProductDetailScreen(
                productId: state.pathParameters['productId'] ?? '',
              ),
            ),
          ]),
    ],
  );
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<CategoryCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<AuthCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ProductDetailCubit>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        title: 'Jumbled',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: JTheme.primaryColor,
            secondary: JTheme.secondaryColor,
            tertiary: JTheme.tertiaryColor,
            background: JTheme.backgroundColor,
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}
