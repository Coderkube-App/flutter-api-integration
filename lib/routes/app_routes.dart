part of 'app_pages.dart';

/// A class containing all the string constants representing application routes.
abstract class Routes {
  /// Root route.
  static const INITIAL = '/';
  
  /// Route for the Home screen.
  static const HOME = '/home';
  
  /// Route for the Login screen.
  static const LOGIN = '/login';
  
  /// General authentication related route.
  static const AUTH = '/auth';
  
  /// Route for a chat screen.
  /// TODO: Implement the chat module and its associated view/viewmodel.
  static const CHAT = '/chat';
  
  /// Route for the user profile screen.
  /// TODO: Implement the profile module and its associated view/viewmodel.
  static const PROFILE = '/profile';

  /// Route for the Movie Detail screen.
  static const MOVIE_DETAIL = '/movie_detail';
}
