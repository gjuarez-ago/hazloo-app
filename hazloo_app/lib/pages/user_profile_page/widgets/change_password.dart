import 'package:flutter/material.dart';
import 'package:hazloo_app/utils/responsive.dart';

class ChangePasswordPage extends StatefulWidget {
  ChangePasswordPage({Key? key}) : super(key: key);

  static String routeName = "change_password_page";


  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
 
 
  TextEditingController passwordText = TextEditingController();
  TextEditingController validatePasswordText = TextEditingController();
  
   

  @override
  Widget build(BuildContext context) {

    
   final Responsive responsive = Responsive.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
         iconTheme: IconThemeData(color:  Color.fromRGBO(137, 107, 4, 8)),
        title: Text(
          'Cambiar contraseña',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color:  Color.fromRGBO(0, 34, 91, 1),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
              Wrap(
                        children: [
                          Text(
                            "Cambia tu contraseña:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    
              SizedBox(
                          height: 24,
                        ),
                        getTextField(
                            hint: "Correo electronico",
                            textController: passwordText,
                            isEmail: true),
                        SizedBox(
                          height: 16,
                        ),
                        getTextField(
                            hint: "Nombre (s)",
                            textController: validatePasswordText,
                            isPassword: true),
                        SizedBox(
                          height: 16,
                        ),
                        

                           SizedBox(
                        width: double.infinity,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(color: Colors.black)),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "Cambiar contraseña",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: responsive.dp(1.8),
                            ),
                          ),
                          onPressed: () {
                           
                          },
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
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          filled: true,
          fillColor: Colors.black12,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          )),
    );
    }



  

}