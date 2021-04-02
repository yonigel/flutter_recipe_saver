import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/homePage.dart';
import './screens/recipeList.dart';

// void main() => runApp(MyApp());

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final appTitle = 'Recipe';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        // if (snapshot.hasError) {
        //   return SomethingWentWrong();
        // }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: appTitle,
            home: MyHomePage(title: appTitle),
            initialRoute: '/home',
            routes: {
              '/home': (context) => MyHomePage(title: 'Home'),
              '/allRecipes': (context) => RecipeList(title: 'Recipe List'),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        // return Loading();
        return MaterialApp(
          title: appTitle,
          home: MyHomePage(title: appTitle),
          initialRoute: '/home',
          routes: {
            '/home': (context) => MyHomePage(title: 'Home'),
            '/allRecipes': (context) => RecipeList(title: 'Recipe List'),
          },
        );
      },
    );
    // return MaterialApp(
    //   title: appTitle,
    //   home: MyHomePage(title: appTitle),
    //   initialRoute: '/home',
    //   routes: {
    //     '/home': (context) => MyHomePage(title: 'Home'),
    //     '/allRecipes': (context) => RecipeList(title: 'Recipe List'),
    //   },
    // );
  }
}
