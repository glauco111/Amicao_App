import 'package:amicao/screens/splash/splash_screen.dart';
import 'package:amicao/stores/category_store.dart';
import 'package:amicao/stores/home_store.dart';
import 'package:amicao/stores/page_store.dart';
import 'package:amicao/stores/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(CategoryStore());
}

Future<void> initializeParse() async {
  await Parse().initialize('POKWiYddP00cyuXkzgM9yaZsHzk3hsjtaNWzll9k',
      'https://parseapi.back4app.com/',
      clientKey: '7q5oKSQSC9X6pvePoNTNVmZNIlocHLMa58a1ouCm',
      autoSendSessionId: true,
      debug: true);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amicao',
      theme: ThemeData(
        cursorColor: Colors.lightBlueAccent,
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.blueAccent,
        appBarTheme: AppBarTheme(elevation: 0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      home: Lottie(),
    );
  }
}
