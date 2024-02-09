import 'package:flutter/material.dart';
import 'package:hazloo_app/pages/about_page/about_page.dart';
import 'package:hazloo_app/pages/advices_page/advices_page.dart';
import 'package:hazloo_app/pages/faq_page/faq_page.dart';
import 'package:hazloo_app/pages/login_page/login_page.dart';
import 'package:hazloo_app/pages/privacy_page/privacy_page.dart';
import 'package:hazloo_app/pages/user_profile_page/user_profile_page.dart';
import 'package:hazloo_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String? name;
  String? surname;
  String? email;
  String initials = "";

  signOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    await Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (_) => false);
  }

  void initialData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      // email = preferences.getString("email")!;
      // name = preferences.getString("name")!;
      // surname = preferences.getString("surname")!;
      // initials = getInitials(name!, surname!);

      email = "bicosind@gmail.com";
      name = "Gabri";
      surname = "Juarez";
      initials = "GA";
    });
  }

  @override
  void initState() {
    initialData();
    super.initState();
  }

  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Constants.blueGeneric,
        child: ListView(
          children: <Widget>[
            buildHeader(name: name, email: email, onClicked: () {}),
            Container(
              color: Colors.white,
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  // buildSearchField(),
                  buildMenuItem(
                    text: 'Inicio',
                    icon: Icons.home,
                    color: const Color.fromARGB(248, 212, 213, 215),
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Mi perfil',
                    icon: Icons.person,
                    color: const Color.fromARGB(248, 189, 241, 185),
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Consejos',
                    icon: Icons.card_giftcard,
                    color: const Color.fromARGB(248, 247, 244, 186),
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Sobre nosotros',
                    icon: Icons.info_outline,
                    color: const Color.fromARGB(248, 141, 207, 215),
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Salir',
                    icon: Icons.exit_to_app,
                    color: const Color.fromARGB(248, 242, 186, 174),
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 14),
                  const Divider(
                    color: Colors.black,
                    height: 3,
                  ),
                  const SizedBox(height: 14),
                  buildMenuItem(
                    text: 'Ayuda',
                    icon: Icons.help,
                    color: const Color.fromARGB(248, 190, 236, 204),
                    onClicked: () => selectedItem(context, 5),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Aviso de privacidad',
                    icon: Icons.policy_outlined,
                    color: const Color.fromARGB(248, 244, 232, 227),
                    onClicked: () => selectedItem(context, 6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    String? urlImage,
    String? name,
    String? email,
    VoidCallback? onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          color: Color.fromARGB(255, 3, 63, 112),
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromARGB(223, 132, 172, 232),
                child: Text(
                  initials,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$name',
                      style: const TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(223, 255, 255, 255)),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$surname',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // const CircleAvatar(
              //   radius: 24,
              //   backgroundColor: Color.fromARGB(223, 7, 43, 96),
              //   child: Icon(Icons.add_comment_outlined, color: Colors.white),
              // )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    const color = Colors.black;

    return TextField(
      style: const TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Inicio',
        hintStyle: const TextStyle(color: color),
        prefixIcon: const Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    String? text,
    IconData? icon,
    VoidCallback? onClicked,
    required Color color,
  }) {
    // final color = Color.fromRGBO(23, 60, 122, .9);
    const hoverColor = Colors.black26;

    return ListTile(
      leading: Icon(
        icon,
        color: Color.fromARGB(255, 79, 78, 78),
      ),
      title: Text(text!,
          style: const TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 79, 78, 78),
          )),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        print('Home');
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const UserProfilePage(),
        ));

        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AdvicesPages(),
        ));

        break;

      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AboutPage(),
        ));
        break;

      case 4:
        signOut();
        break;

      case 5:
       Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const FaqPage(),
        ));        
        break;

      case 6:
         Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const PrivacyPage(),
        ));
        break;

    }
  }

  Route _createRoute(dynamic page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  String getInitials(String name, String surname) {
    return '${name[0]}${surname[0]}';
  }
}
