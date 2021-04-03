import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_recipe_saver/auth_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './screens/homePage.dart';
import './screens/recipeList.dart';
import 'auth_service.dart';

// void main() => runApp(MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Recipe';
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Provider(
        auth: AuthService(),
        child: MaterialApp(
            key: _formKey, title: 'Dreamora', home: HomeController()));
  }
}

class HomeController extends StatelessWidget {
  HomeController({Key key}) : super(key: key);

  var isLoggingInProgress = false;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    isLoggingInProgress = true;
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;

    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          if (!signedIn) {
            signInWithGoogle();
          }
          return signedIn
              ? MaterialApp(
                  title: "logged in",
                  home: MyHomePage(title: "logged in"),
                  initialRoute: '/home',
                  routes: {
                    '/home': (context) => MyHomePage(title: 'logged in'),
                    '/allRecipes': (context) =>
                        RecipeList(title: 'Recipe List'),
                  },
                )
              : Container(
                  color: isLoggingInProgress ? Colors.yellow : Colors.red);
        }
        return Container(
          color: Colors.black,
        );
      },
    );
  }
}
