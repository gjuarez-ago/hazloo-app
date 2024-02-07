import 'package:flutter/material.dart';
import 'package:hazloo_app/utils/constants.dart';
import 'package:material_dialogs/material_dialogs.dart';

Widget emptyWidget = Stack(
  children: [
    Positioned(
      top: 24,
      bottom: 190,
      left: 24,
      right: 24,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Image.asset('assets/images/empty-box.png'),
      ),
    ),
    Positioned(
      top: 120,
      bottom: 0,
      left: 24,
      right: 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Sin tareas',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                letterSpacing: 2,
                color: Color(0xff2f3640),
                fontFamily: 'Anton',
                fontWeight: FontWeight.bold),
          ),
          Text(
            'No hemos encontrado tareas pendientes por completar.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff2f3640),
            ),
          ),
        ],
      ),
    )
  ],
);

Widget errorWidget = Stack(
  children: [
    Positioned(
      top: 24,
      bottom: 350,
      left: 24,
      right: 24,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Image.asset('assets/images/youtube.png'),
      ),
    ),
    Positioned(
      top: 120,
      bottom: 0,
      left: 24,
      right: 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Uy, un error ',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                letterSpacing: 2,
                color: Color(0xff2f3640),
                fontFamily: 'Anton',
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Ha ocurrido un error, contacte al administrador.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff2f3640),
            ),
          ),
        ],
      ),
    )
  ],
);

Widget comingSoonWidget = Stack(
  children: [
    Positioned(
      top: 24,
      bottom: 350,
      left: 24,
      right: 24,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Image.asset('assets/images/coming-soon.png'),
      ),
    ),
    Positioned(
      top: 120,
      bottom: 0,
      left: 24,
      right: 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Proximamente',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                letterSpacing: 2,
                color: Color(0xff2f3640),
                fontFamily: 'Anton',
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Nos encontramos trabajando en ello',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff2f3640),
            ),
          ),
        ],
      ),
    )
  ],
);


Widget loadingWidget = WillPopScope(
            child: Container(
              color: Color.fromARGB(255, 3, 63, 112),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    color: Constants.blueGeneric,
                    padding: EdgeInsets.only(bottom: 20),
                    child: Container(
                      alignment: Alignment.center,
                      child: Lottie.asset(
                        'assets/images/loading.json',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 200, left: 100, right: 100),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/images/hazloo_logo_b.png',
                        // color: Colors.white30,
                      ),
                    ),
                  )
                ],
              ),
            ),
            onWillPop: () async => false,
          );