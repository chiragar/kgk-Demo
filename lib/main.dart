import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk/src/bloc/cart/cart_bloc.dart';
import 'package:kgk/src/bloc/filter/filter_bloc.dart';
import 'package:kgk/src/ui/screen/filter_screen.dart';

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
        theme: ThemeData(
            appBarTheme: AppBarTheme(elevation: 0, centerTitle: true)),
        debugShowCheckedModeBanner: false,
        home: FilterScreen(),
      ),
    );
  }
}
