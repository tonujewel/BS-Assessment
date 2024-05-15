import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/my_app/my_app.dart';
import 'core/services/inection_container.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/splash/bloc/splash_bloc.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashBloc()),
        BlocProvider(create: (_) => sl<HomeBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}
