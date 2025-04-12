# BookBuddy


**Project Overview:**

Project name BookBuddy, designed to display a list of books fetched from the Google Books API.

**Key Features Implemented:**

* **API Integration:** The app fetches book data from the Google Books API, displaying the title, author, and cover image.  Pagination is implemented to load more books as the user scrolls.

* **Book Details Screen:** Tapping a book navigates the user to a details screen, showing the title, author(s), description, and first publish year.

* **Pull to Refresh:** Users can refresh the book list by pulling down on the screen.

* **App Flavors:** The app includes two flavors(Dev, Prod)

* **Project Structure:** The project is organized with a clean and modular architecture.

* **State Management:** The app uses BLoC for state management.

* **Error Handling & UX:** The app displays loading indicators during data fetching and handles errors gracefully, including showing messages for empty data.

* **Platforms:** Application runs on both Android and iOS.

**Additional Points from Provided Content:**

* **Flutter Version:** The app is built using Flutter version ^3.7.2.

* **Setup Instructions:** After cloning the source code, please run

    * `flutter pub get`

    * `flutter pub run build_runner build`

* **Flavor Setup and Build Instructions:** The flavors using the `--dart-define` flag to set the `API_URL`:

    * Development:  `flutter run --dart-define=API_URL=https://www.googleapis.com/books/v1`

    * Local Production: `flutter run --release --dart-define=API_URL=https://www.googleapis.com/books/v1`
    * Android (APK): `flutter build apk --dart-define=API_URL=https://www.googleapis.com/books/v1 --split-per-abi`
    * Android (App Bundle): `flutter build appbundle --dart-define=API_URL=https://www.googleapis.com/books/v1`
    * iOS (Simulator): `flutter build ios --dart-define=API_URL=https://www.googleapis.com/books/v1 --no-codesign`



* **Video URL:** A video demonstration of the app is available at [Download](https://github.com/SubrotaDebnath/BookBuddy/blob/main/examples/assets/Screen_recording_20250412_191936.webm)


