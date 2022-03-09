# food_test

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Dart-only initialization (Recommended)

- Initialize Firebase on all platforms using CLI.
- No need to add any native code.
- No need to download any Google services file.



Install FlutterFire CLI

    dart pub global activate flutterfire_cli

(Optional) Add the following line to your ~/.zshrc file and save it

    export PATH="$PATH":"$HOME/.pub-cache/bin"

Run the configure:

    flutterfire configure

Press enter to configure all the platforms

    https://i.stack.imgur.com/5jDA6.png

You should now have a lib/firebase_options.dart file. Import this file in your main.dart and use Firebase.initializeApp.

    import 'firebase_options.dart';
    
    void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    // This is the last thing you need to add.
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
    
    runApp(...);
    }

https://firebase.google.com/docs/cli#install-cli-mac-linux

