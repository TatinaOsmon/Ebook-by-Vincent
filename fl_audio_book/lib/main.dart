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
import 'package:page_transition/page_transition.dart';

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
        home: const SplashScreen(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return PageTransition(
                child: const SplashScreen(),
                type: PageTransitionType.fade,
              );
            case '/onboarding':
              return PageTransition(
                child: const OnboardingScreen(),
                type: PageTransitionType.fade,
              );
            case '/login':
              return PageTransition(
                child: LoginScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/register':
              return PageTransition(
                child: const RegisterScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/otp':
              return PageTransition(
                child: const OTPVerification(),
                type: PageTransitionType.rightToLeft,
              );
            case '/bottomNavigation':
              return PageTransition(
                child: const BottomNavigationScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/home':
              return PageTransition(
                child: const HomeScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/notification':
              return PageTransition(
                child: const NotificationScreen(),
                type: PageTransitionType.rightToLeft,
              );
            // case '/getPremium':
            //   return PageTransition(
            //     child: const GetPremiumScreen(),
            //     type: PageTransitionType.rightToLeft,
            //   );
            case '/payment':
              return PageTransition(
                child: const PaymentScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/success':
              return PageTransition(
                child: const SuccessScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/mostpopular':
              return PageTransition(
                child: MostPopularScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/storyDetail':
              return PageTransition(
                child: const StoryDetailScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/review':
              return PageTransition(
                child: ReviewScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/reading':
              return PageTransition(
                child: const ReadingScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/audioscreen':
              return PageTransition(
                child: const AudioScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/recommended':
              return PageTransition(
                child: RecommendedScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/newRelease':
              return PageTransition(
                child: NewReleaseScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/paidstory':
              return PageTransition(
                child: PaidStoryScreen(),
                type: PageTransitionType.rightToLeft,
              );
            // case '/famousAuthor':
            //   return PageTransition(
            //     child: FamousAuthorsScreen(),
            //     type: PageTransitionType.rightToLeft,
            //   );
            case '/authorScreen':
              return PageTransition(
                child: const AuthorScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/search':
              return PageTransition(
                child: const Search(),
                type: PageTransitionType.rightToLeft,
              );
            case '/searchScreen':
              return PageTransition(
                child: const SearchScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/horror':
              return PageTransition(
                child: HorrorScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/myBook':
              return PageTransition(
                child: const MyBookScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/profile':
              return PageTransition(
                child: const ProfileScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/editProfile':
              return PageTransition(
                child: const EditProfileScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/download':
              return PageTransition(
                child: const DownloadScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/languages':
              return PageTransition(
                child: const LanguagesScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/followlist':
              return PageTransition(
                child: const FollowListScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/appSettings':
              return PageTransition(
                child: const AppSettings(),
                type: PageTransitionType.rightToLeft,
              );
            case '/termsAndCondition':
              return PageTransition(
                child: const TermsAndConditionScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/privacyPolicy':
              return PageTransition(
                child: const PrivacyPolicyScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case '/helpAndSupport':
              return PageTransition(
                child: const HelpAndSupportScreen(),
                type: PageTransitionType.rightToLeft,
              );
            default:
              return null;
          }
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
