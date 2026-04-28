import 'package:get/get.dart';

/// A class that manages application-wide translations using the GetX package.
class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        /// English (United States) translations.
        'en_US': {
          'app_name': 'Family Tree',
          'home': 'Home',
          'welcome': 'Welcome to Clean Architecture',
        },
        // TODO: Add more languages as needed (e.g., Hindi, Spanish, French).
        
        /// Spanish (Spain) translations.
        'es_ES': {
          'app_name': 'Árbol Familiar',
          'home': 'Inicio',
          'welcome': 'Bienvenido a la Arquitectura Limpia',
        },
      };
}
