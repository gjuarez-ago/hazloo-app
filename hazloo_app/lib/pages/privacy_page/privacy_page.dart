
import 'package:flutter/material.dart';
import 'package:hazloo_app/utils/constants.dart';
import 'package:hazloo_app/widgets/header_widget.dart';

class PrivacyPage extends StatefulWidget {
  
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
   final double _headerHeight = 250;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(left: 16, right: 20),
          alignment: Alignment.center,
          height: 60.0,
          width: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/cotta.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Constants.blueGeneric,
      ),
       body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: _headerHeight,
                child: HeaderWidget(
                  _headerHeight,
                  false,
                  Icons.home_max,
                ), //let's create a common header widget
              ),
              SafeArea(
                child: FittedBox(
                  child: Container(
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(kFixPadding),
                    padding: const EdgeInsets.all(kFixPadding),
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const [
                          BoxShadow(color: kLightColor, blurRadius: 2.0)
                        ]),
                    child: Column(
                      children: [
                        // Text(
                        //     'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        //     style: kDarkTextStyle),
                        // SizedBox(height: 16.0),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: const [
                                Icon(Icons.home),
                                SizedBox(width: 6.0),
                                Text("¿Quienes somos?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22)),
                              ],
                            )),
                        const SizedBox(
                          height: 6.0,
                        ),
                        const Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                            style: TextStyle(color: kLightColor)),
                        const SizedBox(height: 16.0),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: const [
                                Icon(Icons.abc_outlined),
                                SizedBox(width: 6.0),
                                Text("¿Cuál es nuestra misión?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22)),
                              ],
                            )),
                        const SizedBox(
                          height: 6.0,
                        ),
                        const Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                            style: TextStyle(color: kLightColor)),
                        const SizedBox(height: 16.0),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: const [
                                Icon(Icons.phone),
                                SizedBox(width: 6.0),
                                Text("Contacto",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22)),
                              ],
                            )),
                        const SizedBox(
                          height: 6.0,
                        ),
                        const Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                            style: TextStyle(color: kLightColor)),
                        const SizedBox(height: 16.0),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: const [
                                Icon(Icons.phone),
                                SizedBox(width: 6.0),
                                Text("Contacto",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22)),
                              ],
                            )),
                        const SizedBox(
                          height: 6.0,
                        ),
                        const Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                            style: TextStyle(color: kLightColor)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      );
  }
}
