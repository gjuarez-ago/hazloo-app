import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hazloo_app/models/params/task_params.dart';
import 'package:hazloo_app/models/response/task_response.dart';
import 'package:hazloo_app/utils/responsive.dart';
import 'package:hazloo_app/widgets/generic_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/bloc.dart';

class UpdateTask extends StatefulWidget {
  final int? id;

  const UpdateTask({Key? key, this.id}) : super(key: key);

  static String routeName = "update_task_page";

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  TextEditingController titleText = TextEditingController();
  TextEditingController descriptionText = TextEditingController();

  String selectedValuePriority = "1";
  String selectedValueCategory = "1";

  int userId = 0;
  TaskBloc? _taskBloc;
  TaskResponse? task;

  @override
  void dispose() {
    _taskBloc?.add(EventGetTaskByParams(userId: userId, title: ''));
    super.dispose();
  }

  void initialData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userId = preferences.getInt("id")!;
    });
  }

  @override
  void initState() {
    userId = 1;

    _taskBloc = BlocProvider.of<TaskBloc>(context);
    _taskBloc?.add(EventGetTaskById(taskId: widget.id!));
    // initialData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          title: Text(
            'Actualizar Objetivo',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 3, 63, 112),
        ),
        body: BlocConsumer<TaskBloc, TaskState>(
          listener: ((context, state) {
            if (state is ErrorTaskById) {
              message(state.messageError!, Colors.red);
            }            

            if (state is SuccessTaskById) {
              setState(() {
                task = state.response;
                descriptionText.text = state.response!.description;
                titleText.text = state.response!.title;
                selectedValuePriority = state.response!.prioridad.toString();
                selectedValueCategory = state.response!.category.toString();
              });
            }

            if (state is SuccessUpdateTask) {
              message("¡Tarea actualizada correctamente!", Colors.green); 
              Navigator.pop(context);
            }

            if (state is ErrorUpdateTask) {
              message(state.messageError!, Colors.red); 
            }


          }),
          builder: (context, state) {
            if (state is ErrorTaskById) {
              return errorWidget;
            }

            if(state is IsLoadingTaskById) {
              return loadingWidget;
            }

            if(state is IsLoadingUpdateTask) {
              return loadingWidget;
            }

            if (state is SuccessTaskById || state is ErrorUpdateTask) {
              return GestureDetector(
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
                              getTextField(
                                  hint:
                                      "Agrega el número de serie o matricula"),
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
                                            color: Colors.transparent,
                                            width: 0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0),
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
                                            color: Colors.transparent,
                                            width: 0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0),
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
                                  hint:
                                      "¿Por qué quieres cumplir este objetivo?"),
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
                                  onPressed: () => saveTask(),
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
              );
            }

            return loadingWidget;
          },
        ));
  }

  void saveTask() {
    if (descriptionText.value.text == '' || titleText.value.text == '') {
      message("¡Es necesario llenar todos los campos!", Colors.amber[700]);
      return;
    }

    print(descriptionText.value.text);
    print(titleText.value.text);

    TaskParams request = TaskParams(title: titleText.value.text, description: descriptionText.value.text, category: selectedValueCategory, prioridad: selectedValuePriority, user: userId);
    _taskBloc?.add(EventUpdateTask(taskId: widget.id!, request: request));
  }

  Widget getTextField({String? hint}) {
    return TextField(
      controller: titleText,
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
      controller: descriptionText,
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

  message(String title, Color? color) {
    var snackbar = SnackBar(
      backgroundColor: color,
      content: Text(title),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
