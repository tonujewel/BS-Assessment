import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/my_app/my_app.dart';
import 'features/splash/bloc/splash_bloc.dart';

SharedPreferences? prefs;

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashBloc()),
      ],
      child: const MyApp(),
    ),
  );
}
