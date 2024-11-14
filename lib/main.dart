import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form/firebase_options.dart';
import 'package:form/screens/authentication_screen.dart';
import 'package:form/screens/forget_password_screen.dart';
import 'package:form/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: AuthenticationScreen.routeName,
     routes: {
      AuthenticationScreen.routeName:(context) =>  const AuthenticationScreen(),
       HomeScreen.routeName:(context) =>  const HomeScreen(),
      ForgetPasswordScreen.routeName:(context) =>  const ForgetPasswordScreen()

     },
      theme: ThemeData(
       inputDecorationTheme: const  InputDecorationTheme(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 2),)
       ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    
    );
  }
}

