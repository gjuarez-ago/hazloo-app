import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hazloo_app/models/params/task_get_params.dart';
import 'package:hazloo_app/models/response/notification_response.dart';
import 'package:hazloo_app/widgets/generic_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../bloc/bloc.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  static String routeName = "notification_page";

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationBloc? _notiBloc;
  List<NotificationResponse> listRequest = [];
  List<NotificationResponse> listRequestTemp = [];
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
    _notiBloc = BlocProvider.of<NotificationBloc>(context);
    _notiBloc?.add(const EventNotificationList(userId: 1));
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
        _notiBloc?.add(EventNotificationList(userId: 1));
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme:
              const IconThemeData(color: Color.fromRGBO(255, 255, 255, 0.973)),
          title: const Text(
            'Anuncios',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 3, 63, 112),
        ),
        body: BlocConsumer<NotificationBloc, NotificationState>(
          listener: (context, state) {
            if (state is IsLoadingNotificationList) {
            } else if (state is SuccessNotificationList) {
              setState(() {
                listRequest = state.listResponse!;
                listRequestTemp = state.listResponse!;
              });
            }
            if (state is ErrorNotificationList) {
              message(state.messageError!, Colors.red);
              // snackbarError(context, state.messageError!);
            }
          },
          builder: (context, state) {
            if (state is ErrorNotificationList) {
              return errorWidget;
            }

            if (state is IsLoadingNotificationList) {
              return loadingWidget;
            }

            if (state is SuccessNotificationList) {
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
                          child: Icon(Icons.add_alert, color: Colors.black),
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
