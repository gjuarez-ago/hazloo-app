import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hazloo_app/models/params/task_get_params.dart';
import 'package:hazloo_app/models/response/log_response.dart';
import 'package:hazloo_app/widgets/generic_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../bloc/bloc.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  static String routeName = "log_page";

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  
  LogBloc? _logBloc;
  List<LogResponse> listRequest = [];
  List<LogResponse> listRequestTemp = [];
  int userId = 0;
  late TaskGetParams params;

  final lightTextColor = const Color.fromARGB(255, 120, 119, 119);
  final textFieldColor = const Color(0xffF5F6FA);

  // RegisterBloc authBloc;
  void initialData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userId = preferences.getInt("id")!;
    });
  }

  @override
  void initState() {

    _logBloc = BlocProvider.of<LogBloc>(context);
    _logBloc?.add(EventLogList(userId: 1));

    // initialData();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
        // TaskGetParams? params = TaskGetParams(project: '', title: '', user: userId);
        _logBloc?.add(const EventLogList(userId: 1));
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme:
              const IconThemeData(color: Color.fromRGBO(255, 255, 255, 0.973)),
          title: const Text(
            'Historial',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 3, 63, 112),
        ),
        body: BlocConsumer<LogBloc, LogState>(
          listener: (context, state) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            if (state is IsLoadingLogList) {
            } else if (state is SuccessLogList) {
              setState(() {
                listRequest = state.listResponse!;
                listRequestTemp = state.listResponse!;
              });
            }
            if (state is ErrorLogList) {
              message(state.messageError!, Colors.red);
              // snackbarError(context, state.messageError!);
            }
          },
          builder: (context, state) {
            if (state is ErrorLogList) {
              return errorWidget;
            }

            if (state is IsLoadingLogList) {
              return loadingWidget;
            }

            if (state is SuccessLogList) {
              if (state.listResponse!.isEmpty) {
                return emptyWidget;
              }

              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: listRequest.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                        onTap: () {},
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.black12))),
                          child: Icon(Icons.history, color: Colors.black),
                        ),
                        title: Text(
                          "Introduction to Driving",
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            Text("Emitido 2021/02/20",
                                style: TextStyle(color: Colors.black45))
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.black, size: 30.0)),
                  );
                },
              );
            }

            return Text("");
          },
        ),
      ),
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
