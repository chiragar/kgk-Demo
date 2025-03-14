import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk/src/bloc/cart/cart_bloc.dart';
import 'package:kgk/src/bloc/filter/filter_bloc.dart';
import 'package:kgk/src/core/themes/themes.dart';
import 'package:kgk/src/ui/screen/filter_screen.dart';
import 'package:kgk/src/ui/screen/splash_screen.dart';

import 'src/core/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FilterBloc()),
        BlocProvider(create: (_) => CartBloc()),
      ],
      child: MaterialApp(
        navigatorKey: Utils.navigatorKey,
        title: 'KGK Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: Themes.lightTheme,
        home: SplashScreen(),
      ),
    );
  }
}
