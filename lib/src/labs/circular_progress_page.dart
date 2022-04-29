import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({Key? key}) : super(key: key);

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  double porcent = 0.0;
  double newPorcent = 0.0;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    controller.addListener(() {
      // Print the current value of the animation between 0 and 1:
      //print('controller value: ${controller.value}');
      setState(() {
        porcent = lerpDouble(porcent, newPorcent, controller.value)!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: (){
          porcent = newPorcent;
          newPorcent += 10.0;
          if (newPorcent > 100.0) {
            porcent = 0.0;
            newPorcent = 0.0;
          }
          controller.forward( from: 0.0);
          setState(() {});
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: 300,
          height: 300,
          //color: Colors.red,
          child: CustomPaint(
            painter: _MyRadialProgressPainter(porcent),
          ),
        ),
      ),
    );
  }

}

class _MyRadialProgressPainter extends CustomPainter{

  final porcentaje;
  _MyRadialProgressPainter( this.porcentaje );

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
        ..strokeWidth = 4
        ..color = Colors.grey
        ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height / 2.0);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Arco:
    final arcPaint = Paint()
    ..strokeWidth = 10
    ..color = Colors.pink
    ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        arcAngle,
        false,
        arcPaint
    );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

