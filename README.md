# Movie App (Flutter)

A simple and scalable Flutter application to browse movie details using The Movie Database (TMDB) API.
This project follows a clean architecture approach with a reusable API layer powered by Dio.

---

## Features

* Fetch and display movie details
* Scalable API integration using Dio
* Clean and modular project structure
* Centralized API handling (interceptors, logging)
* Optimized network calls

---

## Getting Started

### 1. Clone the repository

```
git clone <your-repo-url>
```

### 2. Install dependencies

```
flutter pub get
```

### 3. Run the app

```
flutter run
```
---

## API Key Setup (IMPORTANT)

This project uses TMDB API.

* You must add your own API key before running the project.

### Steps:

* Create an account on TMDB
* Generate your API key
* Open the file:

```
lib/core/network/api_endpoints.dart
```

* Add your API key:

```dart
class ApiEndpoints {
  static const String baseUrl = 'https://api.themoviedb.org/3';

  static const String apiKey = 'YOUR_API_KEY_HERE';
}
```

---

## Tech Stack

* Flutter
* Dart
* Dio (HTTP client)

---

## Notes

* Do not commit your API key to public repositories
* If API calls fail, check:

    * Internet connection
    * API key validity
    * Rate limits

---

## Best Practices Used

* Singleton Dio client
* Interceptors for logging and request handling
* Separation of concerns (API, UI, Models)
* Reusable network layer

---

## Future Improvements

* Search movies
* Favorites or Watchlist
* Movie trailers
* Dark mode support

---

## Contribution

* Feel free to fork and improve this project
* Pull requests are welcome
