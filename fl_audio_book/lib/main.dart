import 'package:fl_audio_book/cubit/home_cubit.dart';
import 'package:fl_audio_book/localization/localizations.dart';
import 'package:fl_audio_book/localization/localization_const.dart';

import 'package:fl_audio_book/pages/screens.dart';
import 'package:fl_audio_book/service/home_service.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    final bookService = BookService(http.Client());

    return BlocProvider(
      create: (context) => HomeCubit(bookService),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FL StoryTime',
        theme: ThemeData(
          primaryColor: primaryColor,
          primarySwatch: Colors.blue,
          fontFamily: 'Nunito',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/onboarding': (context) => const OnboardingScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/otp': (context) => const OTPVerification(),
          '/bottomNavigation': (context) => const BottomNavigationScreen(),
          '/home': (context) => const HomeScreen(),
          '/notification': (context) => const NotificationScreen(),
          '/payment': (context) => const PaymentScreen(),
          '/success': (context) => const SuccessScreen(),
          '/mostpopular': (context) => MostPopularScreen(),
          '/storyDetail': (context) => const StoryDetailScreen(),
          '/review': (context) => ReviewScreen(),
          '/reading': (context) => const ReadingScreen(),
          '/audioscreen': (context) => const AudioScreen(),
          '/search': (context) => const Search(),
          '/searchScreen': (context) => const SearchScreen(),
          '/horror': (context) => HorrorScreen(),
          '/myBook': (context) => const MyBookScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/editProfile': (context) => const EditProfileScreen(),
          '/download': (context) => const DownloadScreen(),
          '/languages': (context) => const LanguagesScreen(),
          '/followlist': (context) => const FollowListScreen(),
          '/appSettings': (context) => const AppSettings(),
          '/termsAndCondition': (context) => const TermsAndConditionScreen(),
          '/privacyPolicy': (context) => const PrivacyPolicyScreen(),
          '/helpAndSupport': (context) => const HelpAndSupportScreen(),

          // '/pdfViewer': (context) => PDFViewerPage(
          //       pdfUrls:
          //           ModalRoute.of(context)!.settings.arguments as List<String>,
          //       password: BookDetailsScreen.password,
          //     ),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/pdfViewer') {
            final arguments = settings.arguments;
            if (arguments != null &&
                arguments is List<dynamic> &&
                arguments.length >= 3) {
              // final pdfUrls = arguments[0] as String?;
              // final password = arguments[1] as String?;
              // return MaterialPageRoute(
              //   builder: (context) => PDFViewerPage(
              //     pdfUrls: pdfUrls as List<String>,
              //     password: password!,
              //   ),
              // );
            }
          }
          return null;
        },
        locale: _locale,
        supportedLocales: const [
          Locale('en'),
          Locale('hi'),
          Locale('id'),
          Locale('zh'),
          Locale('ar'),
        ],
        localizationsDelegates: [
          DemoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale?.languageCode) {
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
      ),
    );
  }
}
