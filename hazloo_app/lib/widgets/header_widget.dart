import 'package:flutter/material.dart';
import 'package:hazloo_app/utils/constants.dart';

class HeaderWidget extends StatefulWidget {
  final double _height;
  final bool _showIcon;
  final IconData _icon;

  const HeaderWidget(this._height, this._showIcon, this._icon, {Key? key})
      : super(key: key);

  @override
  _HeaderWidgetState createState() =>
      // ignore: no_logic_in_create_state
      _HeaderWidgetState(_height, _showIcon, _icon);
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final double _height;
  final bool _showIcon;
  final IconData _icon;

  _HeaderWidgetState(this._height, this._showIcon, this._icon);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        ClipPath(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Constants.blueGeneric,
                    Color.fromARGB(255, 4, 67, 126),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          clipper: ShapeClipper([
            Offset(width / 5, _height),
            Offset(width / 10 * 5, _height - 60),
            Offset(width / 5 * 4, _height + 20),
            Offset(width, _height - 18)
          ]),
        ),
        ClipPath(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Constants.blueGeneric,
                    Color.fromARGB(255, 4, 34, 117),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          clipper: ShapeClipper([
            Offset(width / 3, _height + 20),
            Offset(width / 10 * 8, _height - 60),
            Offset(width / 5 * 4, _height - 60),
            Offset(width, _height - 20)
          ]),
        ),
        ClipPath(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Constants.blueGeneric,
                    Color.fromARGB(255, 36, 4, 126),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          clipper: ShapeClipper([
            Offset(width / 5, _height),
            Offset(width / 2, _height - 40),
            Offset(width / 5 * 4, _height - 80),
            Offset(width, _height - 20)
          ]),
        ),
        Visibility(
          visible: _showIcon,
          child: SizedBox(
            height: _height - 40,
            child: Center(
              child: Container(
                height: 100.0,
                width: 150,
                margin: const EdgeInsets.all(50),
                padding: const EdgeInsets.only(
                  left: 50.0,
                  top: 50.0,
                  right: 50.0,
                  bottom: 20.0,
                ),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  // border: Border.all(width: 5, color: Colors.white),
                  image: DecorationImage(
                    image: AssetImage('assets/images/hazloo_logo_b.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  List<Offset> _offsets = [];
  ShapeClipper(this._offsets);
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 20);

    // path.quadraticBezierTo(size.width/5, size.height, size.width/2, size.height-40);
    // path.quadraticBezierTo(size.width/5*4, size.height-80, size.width, size.height-20);

    path.quadraticBezierTo(
        _offsets[0].dx, _offsets[0].dy, _offsets[1].dx, _offsets[1].dy);
    path.quadraticBezierTo(
        _offsets[2].dx, _offsets[2].dy, _offsets[3].dx, _offsets[3].dy);

    // path.lineTo(size.width, size.height-20);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
