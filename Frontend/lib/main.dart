import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traductor/components/components.dart';
import 'package:traductor/providers/providers.dart';
import 'package:traductor/screens/screens.dart';
import 'package:traductor/services/services.dart';

void main() {
  runApp(const MyApp());
}

class AppState extends StatefulWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  State<AppState> createState() => _AppStateState();
}

class _AppStateState extends State<AppState> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Loginfomprovider(),),
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => CuentaService()),
        // Agrega más providers según tus necesidades
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'prueba',
        initialRoute: 'splash',
        routes: {
          '/': (_) => const HomeScreen(),
          'splash': (_) => const SplashScreeen(),
          'login': (_) => const LoginScreen(),
          'cuenta':(_) => const CuentaScreen(),
        },
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[100],
          appBarTheme: const AppBarTheme(elevation: 0, color: Colors.red),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppState();
  }
}
