import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_profile/database_service.dart';
import 'package:velocity_x/velocity_x.dart';

class Totallikes extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final int Totallike;
  final String id;
  Totallikes({required this.id, required this.Totallike});
  @override
  _TotallikesState createState() => _TotallikesState();
}

class _TotallikesState extends State<Totallikes>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _ani;
  late Animatable _curve, _tween;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(milliseconds: 100), vsync: this);
    _curve = CurveTween(curve: Curves.ease);
    _tween = Tween<double>(begin: 30, end: 40);
    _ani = _controller.drive(_curve).drive(_tween);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) _controller.reverse();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return IconButton(
              icon: Icon(
                AntDesign.heart,
                color: Vx.red500,
                size: _ani.value,
              ),
              onPressed: () {
                _controller.forward();
                setState(() {
                  print(widget.Totallike);
                  DatabaseService()
                      .blogRef
                      .doc(widget.id)
                      .update({'Totallike': widget.Totallike + 1});
                });
              });
        });
  }
}
