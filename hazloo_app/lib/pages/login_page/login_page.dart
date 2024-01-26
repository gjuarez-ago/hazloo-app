

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hazloo_app/models/response/login_response.dart';
import 'package:hazloo_app/pages/home_page/home_page.dart';
import 'package:hazloo_app/pages/recovery_password_page/recovery_password_page.dart';
import 'package:hazloo_app/pages/register_page/register_page.dart';
import 'package:hazloo_app/utils/dialogs.dart';
import 'package:hazloo_app/widgets/header_widget.dart';
import 'package:hazloo_app/widgets/snackbars.dart';
import 'package:hazloo_app/widgets/theme_helper.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static String routeName = "login_page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();

  TextEditingController userText = TextEditingController();
  TextEditingController passwordText = TextEditingController();

  LoginBloc? _loginBloc;

  bool showPassword = true;
  late String lastEmail;

  @override
  void dispose() {
    userText.dispose();
    passwordText.dispose();
    super.dispose();
  }

  void initialData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString('lastEmail') != null) {
      lastEmail = preferences.getString('lastEmail')!;
      userText.text = lastEmail;
    }
    // ignore: use_build_context_synchronously
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  void initState() {
    initialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();

          if (state is IsLoadingAuth) {
            ProgressDialog.show(context);
          } else if (state is SuccessAuth) {
            ProgressDialog.dissmiss(context);
            snackbarRoundInfo(context, "Logueado con exito",
                const Color.fromARGB(255, 49, 193, 17));

        savePref(state.response!.user, state.response!.token);
        Navigator.pushReplacementNamed(context, HomePage.routeName);
        


// Timer(Duration(seconds: 3), () => {

  
// });

          }

          if (state is ErrorAuth) {
            print(state.messageError);
            ProgressDialog.dissmiss(context);
            snackbarRoundInfo(context, "${state.messageError}", Colors.red);
          }
        }, builder: (context, state) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: _headerHeight,
                    child: HeaderWidget(
                        _headerHeight,
                        true,
                        Icons
                            .login_rounded), //let's create a common header widget
                  ),
                  SafeArea(
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        margin: const EdgeInsets.fromLTRB(
                            20, 10, 20, 10), // This will be the login form
                        child: Column(
                          children: [
                            const Text(
                              'Iniciar sesión',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Ingresa tus credenciales',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 30.0),
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Container(
                                      child: TextFormField(
                                        controller: userText,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Ingresa tu e-mail';
                                          }
                                          return null;
                                        },
                                        decoration:
                                            ThemeHelper().textInputDecoration(
                                          Icons.email,
                                          'Correo electronico',
                                          'Ingresa tu correo electronico',
                                        ),
                                        keyboardType: TextInputType.number,
                                      ),
                                      decoration: ThemeHelper()
                                          .inputBoxDecorationShaddow(),
                                    ),
                                    const SizedBox(height: 30.0),
                                    Container(
                                      child: TextFormField(
                                        controller: passwordText,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Ingresa la contraseña';
                                          }
                                          return null;
                                        },
                                        obscureText: showPassword ? true : false,
                                        decoration: InputDecoration(
                                          labelText: "Contraseña",
                                          hintText: "Ingresa tu contraseña",
                                          fillColor: Colors.white,
                                          prefixIcon: Icon(Icons.password),
                                          suffixIcon: IconButton(
                                              icon: Icon(Icons.remove_red_eye),
                                              onPressed: () {
                                                fnShowPassword(showPassword);
                                              }),
                                          filled: true,
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  20, 10, 20, 10),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade400)),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              borderSide: const BorderSide(
                                                  color: Colors.red,
                                                  width: 2.0)),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                  borderSide: const BorderSide(
                                                      color: Colors.red,
                                                      width: 2.0)),
                                        ),
                                      ),
                                      decoration: ThemeHelper()
                                          .inputBoxDecorationShaddow(),
                                    ),
                                    const SizedBox(height: 15.0),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 20),
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RecoveryPasswordPage()));
                                        },
                                        child: const Text(
                                          "¿Olvidaste tu contraseña?",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: ThemeHelper()
                                          .buttonBoxDecoration(context),
                                      child: ElevatedButton(
                                        style: ThemeHelper().buttonStyle(),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              40, 10, 40, 10),
                                          child: Text(
                                            'Ingresar'.toUpperCase(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                        onPressed: () async {
                                          onSubmit(context);
                                        },
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                            context, RegisterPage.routeName);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 30, 10, 20),
                                        //child: Text('Don\'t have an account? Create'),
                                        child:
                                            const Text.rich(TextSpan(children: [
                                          TextSpan(
                                              text: "Aun no tienes cuenta? "),
                                          TextSpan(
                                            text: 'Registrate',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ])),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
        }));
  }

  void onSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
      final regExp = RegExp(pattern);
      bool validate = true;

      if (!regExp.hasMatch(userText.text.trim())) {
        // ignore: use_build_context_synchronously
        snackbarRoundInfo(context, "No es un email valido!",
            const Color.fromARGB(255, 235, 132, 7));
        validate = false;
      }

      if (validate) {
        _loginBloc?.add(EventAuth(
            user: userText.text.trim(), password: passwordText.text.trim()));

        // ignore: use_build_context_synchronously
      }
    }
  }

  fnShowPassword(value ) {
    setState(() {
          if (value) {
      showPassword = false;
    } else {
      showPassword = true;
    }
    });

  }

  savePref(User value, String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("id", value.id);
      preferences.setString("names", value.names);
      preferences.setString("surnames", value.surnames);
      preferences.setString("username", value.username);
      preferences.setString("token", token);
      preferences.setString(
          "expiredToken", JwtDecoder.getExpirationDate(token).toString());
      // ignore: deprecated_member_use
      preferences.commit();
    });
  }
}
