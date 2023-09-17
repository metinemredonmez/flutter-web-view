import 'dart:async';
import 'dart:io';
import 'widgets/token_generator.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prime_web/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/device_id.dart'; // Yeni cihaz kimliği alma işlevini içeren dosya
import 'widgets/firebase_service.dart'; // Firestore'a cihaz kimliğini kaydetmek için dosya

import '../screens/settings_screen.dart';
import '../screens/splash_screen.dart';
import '../helpers/Constant.dart';
import '../widgets/admob_service.dart';
import '../provider/theme_provider.dart';
import '../provider/navigationBarProvider.dart';



final navigatorKey = GlobalKey<NavigatorState>();
late SharedPreferences pref;

Future<void> _messageHandler(RemoteMessage message) async {}

enableStoragePermision() async {
  // Aynı kodlar devam ediyor... budan sonra scan ve diğer işlemleri altta yap ! 
}



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  AdMobService.initialize();
  await requestNotificationPermissions();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);

  print('Firebase Secret Key: $YourSecretKey'); // Secret Key'i ekrana yazdırır
  //print('Combined Token: $combinedToken');



  int counter = 0;

  if (isStoragePermissionEnabled) {
    await enableStoragePermision();
  }

   deviceId = await getDeviceId();
  final firebaseService = FirebaseService();

  // Cihaz kimliğini Firestore'a kaydet
  firebaseService.saveDeviceId(deviceId);

  // Token oluşturma işlevini kullanarak token oluştur
   token =  generateToken(deviceId, YourSecretKey); // Burada gizli anahtarınızı ekleyin
  print('Web URL: $webinitialUrl');

  // Firebase'e token'i kaydet
  firebaseService.saveToken(deviceId, token);

  SharedPreferences.getInstance().then((prefs) {
    prefs.setInt('counter', counter);
    var isDarkTheme =
    prefs.getBool("isDarkTheme") ?? ThemeMode.system == ThemeMode.dark
        ? true
        : false;

    return runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(
            create: (_) => ThemeProvider(isDarkTheme),
          ),
          ChangeNotifierProvider<NavigationBarProvider>(
            create: (_) => NavigationBarProvider(),
          ),
        ],
        child: MyApp(),
      ),
    );
  });
}

Future<void> requestNotificationPermissions() async {
  // Aynı kodlar devam ediyor...
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationBarProvider>(
          create: (_) => NavigationBarProvider(),
        )
      ],
      child: Consumer<ThemeProvider>(builder: (context, value, child) {
        return MaterialApp(
          title: appName,
          debugShowCheckedModeBanner: false,
          themeMode: value.getTheme(),
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          navigatorKey: navigatorKey,
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case 'settings':
                return CupertinoPageRoute(builder: (_) => SettingsScreen());
            }
          },
          home: showSplashScreen
              ? SplashScreen()
              : MyHomePage(
            webUrl: webinitialUrl,
          ),
        );
      }),
    );
  }
}