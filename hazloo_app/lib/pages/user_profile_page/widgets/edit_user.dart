import 'package:flutter/material.dart';
import 'package:hazloo_app/utils/responsive.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({Key? key}) : super(key: key);

  static String routeName = "edit_user_page";

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  TextEditingController email = TextEditingController();
  TextEditingController firtsName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Scaffold(
    appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        title: Text(
          'Actualizar perfil',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 3, 63, 112),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 16,
              ),
              getTextField(
                  hint: "Nombre y apellidos (S)",
                  textController: email,
                  isEmail: true),
              const SizedBox(
                height: 16,
              ),
              getTextField(
                  hint: "Genero",
                  textController: firtsName,
                  isPassword: true),
              const SizedBox(
                height: 16,
              ),
             
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: const BorderSide(color: Colors.black)),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Actualizar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.dp(1.8),
                    ),
                  ),
                  onPressed: () {},
                  color: Color.fromRGBO(0, 34, 91, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTextField(
      {required String hint,
      required TextEditingController textController,
      bool isPassword = false,
      bool isEmail = false}) {
    return TextField(
      controller: textController,
      obscureText: isPassword,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          filled: true,
          fillColor: Colors.black12,
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          )),
    );
  }
}
