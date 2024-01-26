import 'package:flutter/material.dart';
import 'package:hazloo_app/pages/login_page/login_page.dart';
import 'package:hazloo_app/utils/constants.dart';
import 'package:hazloo_app/utils/responsive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static String routeName = "splash_page";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
late String lastEmail;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Widget
      getPref();
    });
  }

  signOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    lastEmail = sharedPreferences.getString('lastEmail')!;
    await sharedPreferences.clear();
    sharedPreferences.setString("lastEmail", lastEmail);
    await Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (_) => false);
  }

  getPref() async {
    await Future.delayed(const Duration(seconds: 2));
    String? token;
    bool hasExpired = false;
    bool? dactilar;

    SharedPreferences preferences = await SharedPreferences.getInstance();

    token = preferences.getString('token');
    dactilar = preferences.getBool('dactilar');

    if (token != null) {
      hasExpired = JwtDecoder.isExpired(token);
      print(hasExpired);
    }

    print(token);
    if (token != null && !hasExpired) {
        signOut();
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      
    } else {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      // body: Stack(
      //   fit: StackFit.expand,
      //   children: <Widget>[
      //     // Image.asset(
      //     //   'assets/images/logon.png',
      //     //   fit: BoxFit.cover,
      //     //   color: const Color.fromARGB(115, 255, 255, 255),
      //     //   colorBlendMode: BlendMode.darken,
      //     // ),
      //     // Image.asset(
      //     //   'assets/img/logo.png',
      //     //   color: Colors.white30,
      //     // ),
      //     Container(
      //       color: const blueGeneric,
      //       padding: EdgeInsets.only(bottom: responsive.dp(4)),
      //       child: Container(
      //         alignment: Alignment.center,
      //         child: Lottie.asset(
      //           'assets/images/loading.json',
      //           fit: BoxFit.contain,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: Container(
        color: Colors.blue,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              color: Constants.blueGeneric,
              padding: EdgeInsets.only(bottom: responsive.dp(4)),
              child: Container(
                alignment: Alignment.center,
                child: Lottie.asset(
                  'assets/images/loading.json',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 200, left: 100, right: 100),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/hazloo_logo_b.png',
                  // color: Colors.white30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
