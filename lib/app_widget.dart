import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nlw_flutter/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:nlw_flutter/modules/home/home_page.dart';
import 'package:nlw_flutter/modules/insert_boleto/insert_boleto_page.dart';
import 'package:nlw_flutter/modules/login/login_page.dart';
import 'package:nlw_flutter/modules/splash/splash_page.dart';
import 'package:nlw_flutter/shared/models/user_model.dart';
import 'package:nlw_flutter/shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayFlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashPage(),
        "/home": (context) => HomePage(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
        "/login": (context) => const LoginPage(),
        "/barcode_scanner": (context) => const BarcodeScannerPage(),
        "/insert_boleto": (context) => InsertBoletoPage(
              barcode: ModalRoute.of(context) != null
                  ? ModalRoute.of(context)!.settings.arguments.toString()
                  : '',
            ),
      },
    );
  }
}
