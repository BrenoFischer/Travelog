import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelog/auth_binding.dart';
import 'package:travelog/ui/constants.dart';
import 'root.dart';
import 'package:travelog/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travelog/ui/size_config.dart';
import 'package:travelog/ui/size_styling.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  FocusManager.instance.primaryFocus.unfocus();
                }
              },
              child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                initialBinding: AuthBinding(),
                title: 'Flutter Demo',
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.grey[100],
                  cursorColor: primaryColor,
                  primaryColor: primaryColor,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: TextTheme(
                    headline6: AppStyles.appBarTitle,
                  ),
                ),
                home: Root(),
                routes: {"/welcome": (_) => new WelcomeScreen()},
              ),
            );
          },
        );
      },
    );
  }
}
