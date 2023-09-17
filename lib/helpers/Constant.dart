import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prime_web/helpers/Strings.dart';
import 'package:prime_web/helpers/icons.dart';
import 'package:prime_web/widgets/device_id.dart';


const appName = 'Ongi';
const String appbartitle = 'Ongi';
const String androidPackageName = 'com.ongi.app';

// Burada deviceId ve randomToken değerlerini almanız gerekecek
 String deviceId = '';
 String token = '';



// Uygulamanızın ana URL'sini burada güncelleyin
late String webinitialUrl = 'http://mobil.fzsbank.com.tr/?$deviceId&$token';
///api?device_id=$deviceId&token=$randomToken
const String firstTabUrl = '';


const String YourSecretKey = 'firebase-adminsdk-j7yhy@ongi-693ad.iam.gserviceaccount.com';


// Diğer sayfa URL'lerini burada tanımlayın
const String aboutPageURL = '';
const String privacyPageURL = '';
const String termsPageURL = '';

// Android ve iOS uygulama kimliklerini burada tanımlayın
const String androidAppId = androidPackageName;
const String iOSAppId = '';

const String shareAppTitle = appName;
const String shareiOSAppMessage = 'Download $appName App from this link : $appstoreURLIos';
const String shareAndroidAppMessge = 'Download $appName App from this link : $playstoreURLAndroid';

const String playstoreURLAndroid = 'https://play.google.com/store/apps/details?id=$androidAppId';
const String appstoreURLIos = 'https://testflight.apple.com/join/l6t5kD1G';

// Reklamları açma / kapatma seçeneklerini burada belirleyin
const bool showInterstitialAds = false;
const bool showBannerAds = false;
const bool showOpenAds = false;

// Alt gezinme çubuğunu görüntüleme / gizleme seçeneklerini burada belirleyin
const bool showBottomNavigationBar = false;

// Kayan eylem düğmesini görüntüleme / gizleme seçeneklerini burada belirleyin
const bool showFloatingActionButton = false;

// Splash ekranını görüntüleme / gizleme seçeneklerini burada belirleyin
const bool showSplashScreen = true;

// Onboarding ekranını görüntüleme / gizleme seçeneklerini burada belirleyin
const bool showOnboardingScreen = true;

// Web sitesinin başlık ve altbilgisini görüntüleme / gizleme seçeneklerini burada belirleyin
const bool hideHeader = false;
const bool hideFooter = false;

// Reklam kimliklerini burada belirleyin
const androidInterstitialAdId = 'ca-app-pub-3940256099942544/1033173712';
const iosInterstitialAdId = 'ca-app-pub-3940256099942544/4411468910';
const androidBannerAdId = 'ca-app-pub-3940256099942544/6300978111';
const iosBannerAdId = 'ca-app-pub-3940256099942544/2934735716';
const androidOpenAdId = 'ca-app-pub-3940256099942544/3419835294';
const iosOpenAdId = 'ca-app-pub-3940256099942544/5662855259';

// Bildirimler için simgeyi burada belirleyin
const String notificationIcon = '@mipmap/ic_launcher_squircle';

// İkon yolu burada belirleyin
const String iconPath = 'assets/icons/';

// Depolama iznini etkinleştirme / devre dışı bırakma seçeneğini burada belirleyin
const bool isStoragePermissionEnabled = false;

// Gezinme sekmelerini burada ekleyin / kaldırın
List navigationTabs(BuildContext context) => [
  {
    'url': firstTabUrl,
    'label': CustomStrings.demo,
    'icon': Theme.of(context).colorScheme.demoIcon
  },
  {
    'url': webinitialUrl,
    'label': CustomStrings.home,
    'icon': Theme.of(context).colorScheme.homeIcon
  },
];

