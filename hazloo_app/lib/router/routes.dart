
import 'package:flutter/material.dart';
import 'package:hazloo_app/pages/about_page/about_page.dart';
import 'package:hazloo_app/pages/faq_page/faq_page.dart';
import 'package:hazloo_app/pages/home_page/home_page.dart';
import 'package:hazloo_app/pages/log_page.dart/log_page.dart';
import 'package:hazloo_app/pages/login_page/login_page.dart';
import 'package:hazloo_app/pages/new_task/new_task.dart';
import 'package:hazloo_app/pages/notification_page/notification_page.dart';
import 'package:hazloo_app/pages/recovery_password_page/recovery_password_page.dart';
import 'package:hazloo_app/pages/register_page/register_page.dart';
import 'package:hazloo_app/pages/reset_password_page/reset_password_page.dart';
import 'package:hazloo_app/pages/splash_page/splash_page.dart';
import 'package:hazloo_app/pages/update_task/update_task.dart';
import 'package:hazloo_app/pages/user_profile_page/user_profile_page.dart';
import 'package:hazloo_app/pages/welcome_page/welcome_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    AboutPage.routeName: (BuildContext context) => const AboutPage(),
    HomePage.routeName: (BuildContext context) => const HomePage(),
    FaqPage.routeName: (BuildContext context) => const FaqPage(),
    LoginPage.routeName: (BuildContext context) => const LoginPage(),
    LogPage.routeName: (BuildContext context) => const LogPage(),
    NotificationPage.routeName: (BuildContext context) =>
        const NotificationPage(),
    RecoveryPasswordPage.routeName: (BuildContext context) =>
        const RecoveryPasswordPage(),
    RegisterPage.routeName: (BuildContext context) => const RegisterPage(),
    NewTask.routeName: (BuildContext context) => const NewTask(),
    UpdateTask.routeName: (BuildContext context) => const UpdateTask(),
    ResetPasswordPage.routeName: (BuildContext context) =>
        const ResetPasswordPage(),
   
    SplashPage.routeName: (BuildContext context) => const SplashPage(),
    UserProfilePage.routeName: (BuildContext context) =>
        const UserProfilePage(),
    WelcomePage.routeName: (BuildContext context) => const WelcomePage(),
  };
}
