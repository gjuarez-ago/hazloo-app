import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hazloo_app/bloc/bloc.dart';
import 'package:hazloo_app/models/params/task_get_params.dart';
import 'package:hazloo_app/models/response/example_response.dart';
import 'package:hazloo_app/models/response/task_response.dart';
import 'package:hazloo_app/pages/log_page.dart/log_page.dart';
import 'package:hazloo_app/pages/new_task/new_task.dart';
import 'package:hazloo_app/pages/notification_page/notification_page.dart';
import 'package:hazloo_app/pages/update_task/update_task.dart';
import 'package:hazloo_app/utils/dialogs.dart';
import 'package:hazloo_app/widgets/generic_pages.dart';
import 'package:hazloo_app/widgets/navigation_drawer.dart';
// import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:confetti/confetti.dart';
import 'package:hazloo_app/widgets/snackbars.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String routeName = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TaskBloc? _taskBloc;
  List<TaskResponse> listRequest = [];
  List<TaskResponse> listRequestTemp = [];
  int userId = 0;
  late TaskGetParams params;

  TextEditingController searchText = TextEditingController();
  bool value = false;
  var items = List<String>.generate(10, (i) => "$i");

  final lightTextColor = const Color.fromARGB(255, 120, 119, 119);
  final textFieldColor = const Color(0xffF5F6FA);

  // RegisterBloc authBloc;
  void initialData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userId = preferences.getInt("id")!;
    });
  }

  late ConfettiController _controllerCenter;
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;
  late ConfettiController _controllerTopCenter;
  late ConfettiController _controllerBottomCenter;

  @override
  void initState() {

    userId = 1;
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _taskBloc = BlocProvider.of<TaskBloc>(context);
    _taskBloc?.add(EventGetTaskByParams(userId: userId, title: ''));
    // initialData();

    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    _controllerTopCenter.dispose();
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const NotificationPage()));
    }

    if (_selectedIndex == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const NewTask()));
    }

    if (_selectedIndex == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LogPage()));
    }

    setState(() {
      _selectedIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        displacement: 250,
        backgroundColor: const Color.fromARGB(255, 8, 8, 8),
        color: const Color.fromARGB(255, 236, 232, 232),
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          searchText.text = '';
          // TaskGetParams? params = TaskGetParams(project: '', title: '', user: userId);
          _taskBloc?.add(EventGetTaskByParams(userId:userId, title: ''));
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 3, 63, 112),
              title: Container(
                padding: const EdgeInsets.only(left: 16, right: 20),
                alignment: Alignment.center,
                height: 30.0,
                width: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hazloo_logo_b.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              centerTitle: true,
              elevation: 0.0,
              iconTheme: const IconThemeData(color: Colors.white),
              actions: [
                GestureDetector(
                  onTap: () {
                    _controllerCenter.play();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 16,
                      right: 16,
                    ),
                    child: Stack(
                      children: <Widget>[
                        const Icon(Icons.person_pin),
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 4, 65, 116),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            drawer: NavigationDrawer(),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.notification_add),
                  label: 'Notificaciones',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_box),
                  label: 'Nueva tarea',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'Log',
                ),
              ],
            ),
            body: BlocConsumer<TaskBloc, TaskState>(listener: (context, state) {

              if (state is SuccessCreateTask) {
  message( "¡Tarea creada correctamente! 😀",
                const Color.fromARGB(255, 49, 193, 17));
          _taskBloc?.add(const EventGetTaskByParams(userId: 1, title: ''));

                // snackbarRoundInfo("", Colors.green);
              }

                 if(state is ErrorDeleteteTask) {
                  message(state.messageError!, Colors.red);
              }

              if(state is IsLoadingDeleteTask) {
                print("LOADING......................");

              }
              
              if(state is SuccessDeleteTask) {
                message("¡Tarea eliminada correctamente! 😀", Colors.green);
                    _controllerCenter.play();
                                                          _taskBloc?.add(const EventGetTaskByParams(userId: 1, title: ''));


                                 

              }


              if (state is IsLoadingListTask) {
                // ProgressDialog.show(context);
                // showGeneralLoading(context);
              } else if (state is SuccessListTask) {
                // ProgressDialog.dissmiss1(context);
                setState(() {
                  listRequest = state.listResponse!;
                  listRequestTemp = state.listResponse!;
                });

                   Timer(const Duration(seconds: 5), () {
                                      _controllerCenter.stop();
                                    });
              }

              if (state is ErrorListTask) {
                                  message(state.messageError!, Colors.red);
                // ProgressDialog.dissmiss1(context);
                // snackbarError(context, state.messageError!);
              }
            }, builder: (context, state) {
             
              if (state is IsLoadingListTask) {
                return loadingWidget;
              }


              if (state is ErrorListTask) {
                return errorWidget;
              }

              if (state is SuccessListTask) {
                if (state.listResponse!.isEmpty) {
                  return emptyWidget;
                }

                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: ConfettiWidget(
                            confettiController: _controllerCenter,
                            blastDirectionality: BlastDirectionality
                                .explosive, // don't specify a direction, blast randomly
                            shouldLoop:
                                true, // start again as soon as the animation is finished
                            colors: const [
                              Colors.green,
                              Colors.blue,
                              Colors.pink,
                              Colors.orange,
                              Colors.purple
                            ], // manually specify the colors to be used
                            createParticlePath:
                                drawStar, // define a custom shape/path.
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(
                                  left: 0.0, right: 0.0, bottom: 10, top: 10),
                              child: Wrap(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "Objetivos pendientes",
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 18, 0, 0),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 20.0,
                                        right: 20.0,
                                        bottom: 10,
                                        top: 15.0),
                                    child: TextField(
                                      onSubmitted: (String value) {
                                        _taskBloc?.add(
                                            EventGetTaskByParams(userId: userId, title: value));
                                      },
                                      controller: searchText,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 0),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 14),
                                          filled: true,
                                          fillColor: textFieldColor,
                                          hintText: 'Busqueda por titulo....',
                                          hintStyle: const TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: listRequest.length,
                              itemBuilder: (context, index) {
                                final item = listRequest[index];

                                return Dismissible(
                                  key: UniqueKey(),

                                  // only allows the user swipe from right to left
                                  direction: DismissDirection.endToStart,

                                  // Remove this product from the list
                                  // In production enviroment, you may want to send some request to delete it on server side
                                  onDismissed: (_) {
                                    deleteTaskById(item.id);
                                    
                                    setState(() {
                                        listRequest.removeAt(index);
                                    });
                                  },

                                  // This will show up when the user performs dismissal action
                                  // It is a red background and a trash icon
                                  background: Container(
                                    color: Colors.red,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    // alignment: Alignment.centerRight,
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Container(
                                            child: ConfettiWidget(
                                              confettiController:
                                                  _controllerCenter,
                                              blastDirectionality:
                                                  BlastDirectionality
                                                      .explosive, // don't specify a direction, blast randomly
                                              shouldLoop:
                                                  true, // start again as soon as the animation is finished
                                              colors: const [
                                                Colors.green,
                                                Colors.blue,
                                                Colors.pink,
                                                Colors.orange,
                                                Colors.purple
                                              ], // manually specify the colors to be used
                                              createParticlePath:
                                                  drawStar, // define a custom shape/path.
                                            ),
                                          ),
                                          const SizedBox(),
                                          ListTile(
                                            leading: ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                minWidth: 44,
                                                minHeight: 44,
                                                maxWidth: 64,
                                                maxHeight: 64,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/exercise.png',
                                                  fit: BoxFit.cover,
                                                  scale: 1,
                                                ),
                                              ),
                                            ),
                                            title: Text("${item.title}  - ${item.id} "),
                                            subtitle: Text(item.description),
                                            trailing: Icon(
                                                Icons.tag_faces_rounded,
                                                color: listRequest[index].id %
                                                            2 ==
                                                        1
                                                    ? Colors.amber
                                                    : Colors.red[800]),
                                            isThreeLine: true,
                                            contentPadding:
                                                const EdgeInsets.all(10.0),
                                            selected: false,
                                            selectedColor: const Color.fromARGB(
                                                255, 1, 6, 10),
                                            selectedTileColor:
                                                const Color.fromARGB(
                                                    255, 192, 230, 255),
                                            onTap: () {
                                                Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  UpdateTask(id: item.id)));
                                            },
                                            onLongPress: () {
                                              // Navigator.of(context).push(
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             ViewRequestPage(
                                              //                 params: item)));
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return loadingWidget;
            })));
  }

  confirm(BuildContext context,
      {required String title, required List<Object> values}) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return SimpleDialogOption(
                onPressed: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5, top: 5),
                  child: Text("Solicitud:"),
                ),
              );
            },
            itemCount: values.length,
          ),
        ),
        actions: [
          TextButton(
            child: const Text("Aceptar"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  void deleteTaskById(int id) {
    _taskBloc?.add(EventDeleteTaskById(taskId: id));
  }

  message(String title, Color? color) {
    var snackbar = SnackBar(
      backgroundColor: color,
      content: Text(title),
      duration: Duration(seconds: 4),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void searhRequest(String value) {
    // var listFiltered = listRequest.where((x) => x.request.idRequest == value);

    // if (listFiltered.isNotEmpty) {
    //   setState(() {
    //     listRequest = listFiltered.toList();
    //   });
    // }
  }
}
