
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
         iconTheme: IconThemeData(color:  Color.fromRGBO(137, 107, 4, 8)),
        title: Text(
          'Actualizar perfil',
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
           
                    
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                                Container(
                              child:  Text(
          isSwitched ? 'Perfil publico' : 'Perfil privado',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color:  Color.fromRGBO(0, 34, 91, 1),
          ),
                            ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child:  Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                print(isSwitched);
              });
            },
            activeTrackColor: Color.fromRGBO(0, 34, 91, 1),
            activeColor: Colors.white,
          ),
                            ),
                        
                          ],
                        ),
                    
              SizedBox(
                          height: 16,
                        ),
                        getTextField(
                            hint: "Correo electronico",
                            textController: email,
                            isEmail: true),
                        SizedBox(
                          height: 16,
                        ),
                        getTextField(
                            hint: "Nombre (s)",
                            textController: firtsName,
                            isPassword: true),
                        SizedBox(
                          height: 16,
                        ),
                        getTextField(
                            hint: "Apellido (s)",
                            textController: email,
                            isEmail: true),
                        SizedBox(
                          height: 16,
                        ),
                        getTextField(
                            hint: "Clave electoral (INE)",
                            textController: firtsName,
                            isPassword: true),
                        SizedBox(
                          height: 16,
                        ),

                        Wrap(
                        children: [
                          Text(
                            "Otros datos:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    
              SizedBox(
                          height: 16,
                        ),
          getTextField(
                            hint: "Estado",
                            textController: email,
                            isEmail: true),
                        SizedBox(
                          height: 16,
                        ),
                        getTextField(
                            hint: "Ciudad",
                            textController: firtsName,
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
                            "Actualizar",
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