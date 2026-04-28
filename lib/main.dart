import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/theme/app_colors.dart';
import 'core/localization/app_localization.dart';
import 'routes/app_pages.dart';

/// The entry point of the application.
/// 
/// Performs initial setup such as binding initialization, orientation lock,
/// and starting the [MyApp] widget.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait mode for a consistent UI experience.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // TODO: Initialize services like Firebase, Crashlytics, etc. here.
  runApp(const MyApp());
}

/// The root widget of the application.
/// 
/// Configures global settings such as theme, localization, and routing using [GetMaterialApp].
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Configure the system UI overlay for a transparent status bar.
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return GetMaterialApp(
      title: 'Flutter API Integration', // TODO: Fetch from localization or constants.
      debugShowCheckedModeBanner: false,

      // Localization setup
      translations: AppLocalization(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),

      // MVVM Routing setup
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

      /// Global Theme configuration.
      theme: ThemeData(
        fontFamily: 'Kanit',

        /// Define the application's color scheme.
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),

        /// Standardize elevated button styles.
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryLight,
            foregroundColor: AppColors.textPrimary,
            textStyle: const TextStyle(
              fontSize: 20,
              height: 1,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.w400,
            ),
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36),
            ),
          ),
        ),

        /// Standardize text button styles.
        textButtonTheme: TextButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: AppColors.primary,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(34),
            ),
          ),
        ),

        /// Global AppBar styling.
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Kanit',
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: AppColors.backgroundButtonBrown,
            height: 1,
          ),
        ),
      ),

      /// Global builder for wrapping all pages with common functionality.
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        return Directionality(
          textDirection: TextDirection.ltr,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // Dismiss keyboard when tapping outside of input fields.
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: MediaQuery(
              data: mediaQueryData.copyWith(
                textScaler: const TextScaler.linear(1.0), // Disable system text scaling.
              ),
              child: ScrollConfiguration(
                behavior: AppBehavior(),
                child: SafeArea(
                  top: false,
                  left: false,
                  right: false,
                  child: child!,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// A custom [ScrollBehavior] to disable the default overscroll glow effect.
class AppBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
