
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hazloo_app/models/params/task_params.dart';
import 'package:hazloo_app/pages/home_page/home_page.dart';
import 'package:hazloo_app/utils/dialogs.dart';
import 'package:hazloo_app/utils/responsive.dart';
import 'package:hazloo_app/widgets/snackbars.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/bloc.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  static String routeName = "new_ask_page";

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {

  TaskBloc? _taskBloc;
  int userId = 0;

  String descriptionText = "";
  String goalText = "";
  String selectedValuePriority = "1";
  String selectedValueCategory = "1";

  // RegisterBloc authBloc;
  void initialData()  {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // setState(() {
    //   userId = preferences.getInt("id")!;
    // });

    userId = 1;


  }

  @override
  void initState() {
    _taskBloc = BlocProvider.of<TaskBloc>(context);
    initialData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  void saveTask() {

    if (descriptionText == '' || goalText == '') {
      message("¡Es necesario llenar todos los campos!", Colors.amber[700]);
      return;
    }

    TaskParams request = TaskParams(title: goalText, description: descriptionText, category: selectedValueCategory, prioridad: selectedValuePriority, user: userId);
    _taskBloc?.add(EventCreateTask(request: request));
  }

  message(String title, Color? color) {
    var snackbar = SnackBar(
      backgroundColor: color,
      content: Text(title),duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

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
          'Crear Objetivo',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 3, 63, 112),
      ),
      body: MultiBlocListener(
        listeners: [
          listenerCreateTask()
        ],
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 22,
                        ),
                        Wrap(
                          children: [
                            Text(
                              "Objetivo de hoy:",
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
                        getTextField(hint: "¿Cuál es el objetivo?"),
                        SizedBox(
                          height: 16,
                        ),
      
                        Wrap(
                          children: [
                            Text(
                              "Categoría:",
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
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 14),
                                filled: true,
                                fillColor: Colors.black12,
                                hintText: "Categoría seleccionada",
                                hintStyle: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                )),
                            isExpanded: true,
                            value: selectedValueCategory,
                            items: [
                              DropdownMenuItem(
                                child: Text("Escuela"),
                                value: "1",
                              ),
                              DropdownMenuItem(
                                child: Text("Laboral"),
                                value: "2",
                              ),
                              DropdownMenuItem(
                                child: Text("Fitness"),
                                value: "3",
                              ),
                              DropdownMenuItem(
                                child: Text("Personal"),
                                value: "4",
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedValueCategory = value.toString();
                              });
                            },
                            hint: Text("Selecciona una opción")),
                        SizedBox(
                          height: 16,
                        ),
                        Wrap(
                          children: [
                            Text(
                              "Prioridad:",
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
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 14),
                                filled: true,
                                fillColor: Colors.black12,
                                hintText: "Selecciona la prioridad",
                                hintStyle: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                )),
                            isExpanded: true,
                            value: selectedValuePriority,
                            items: [
                              DropdownMenuItem(
                                child: Text("Baja"),
                                value: "1",
                              ),
                              DropdownMenuItem(
                                child: Text("Media"),
                                value: "2",
                              ),
                              DropdownMenuItem(
                                child: Text("Alta"),
                                value: "3",
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedValuePriority = value.toString();
                              });
                            },
                            hint: Text("Selecciona una opción")),
                        SizedBox(
                          height: 16,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       "¿Eres el propietario?",
                        //       style: TextStyle(
                        //         fontSize: 18,
                        //         fontWeight: FontWeight.w600,
                        //         color: Colors.black87,
                        //       ),
                        //     ),
      
                        //     Checkbox(
                        //   value: changeOwner,
                        //   onChanged: (bool value) {
                        //   setState(() {
                        //    changeOwner = value;
                        //   });
                        //   }
                        // ),
                        //   ],
                        // ),
      
                        Wrap(
                          children: [
                            Text(
                              "Descripción",
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
                        getTextArea(
                            hint: "¿Por qué quieres cumplir este objetivo?"),
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
                              "Crear Objetivo",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: responsive.dp(1.8),
                              ),
                            ),
                            onPressed: saveTask,
                            color: Color.fromARGB(255, 3, 63, 112),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }


    BlocListener listenerCreateTask() {
    return BlocListener<TaskBloc, TaskState>(listener: (context, state) {

      if (state is IsLoadingCreateTask) {
      } 
      
      if (state is SuccessCreateTask) {
      //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      //   builder: (context) => const HomePage()
      // ),ModalRoute.withName("/home_page"));
      Navigator.pop(context);

      } else if (state is ErrorCreateTask) {
        message(state.messageError!, Colors.red);
      }
    });
  }

  Widget getTextField({String? hint}) {
    return TextField(
      onChanged: (value) {
        goalText = value;
      },
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


  Widget getTextArea({String? hint}) {
    return TextField(
      onChanged: (value) {
        setState(() {
          descriptionText = value.toString();
        });
      },
      keyboardType: TextInputType.text,
      maxLines: 8,
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
