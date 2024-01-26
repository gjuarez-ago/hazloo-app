import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hazloo_app/pages/home_page/home_page.dart';
import 'package:hazloo_app/pages/welcome_page/welcome_page.dart';
import 'package:hazloo_app/router/routes.dart';
import 'package:hazloo_app/services/bloc_services.dart';

import 'bloc/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // providers: blocsServices(token == null ? "" : ""),
      providers: blocsServices(""),
      child: MaterialApp(
        title: 'Hazloo App',
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.routeName,
        theme: ThemeData(
          // scaffoldBackgroundColor: Colors.blueAccent,
          // visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Comfortaa',
          // appBarTheme: const AppBarTheme(elevation: 0.0),
        ),
        routes: getApplicationRoutes(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}