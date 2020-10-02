import 'package:flutter/material.dart';
import 'package:travelog/screens/login.dart';
import 'package:travelog/constants.dart';
import 'package:travelog/screens/welcome.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          cursorColor: primaryColor,
          primaryColor: primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
              headline6: GoogleFonts.sansita(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )),
        ),
        home: Login(title: 'Travelog'),
        routes: {"/welcome": (_) => new WelcomeScreen()},
      ),
    );
  }
}
