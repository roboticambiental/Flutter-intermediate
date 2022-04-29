import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  late double porcent;
  late Color tintColor;
  late Color secondaryColor;
  late Color backgroundColor;
  late double mainWidth;
  late double secondaryWidth;

  RadialProgress({
    Key? key,
    required this.porcent,
    this.tintColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.secondaryColor = Colors.red,
    this.mainWidth = 10,
    this.secondaryWidth = 4,
  }) : super(key: key);

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    print("initState...");
    porcentajeAnterior = widget.porcent;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build...");
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcent - porcentajeAnterior;
    porcentajeAnterior = widget.porcent;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialProgressPainter(
              (widget.porcent - diferenciaAnimar) +
                  (diferenciaAnimar * controller.value),
              widget.tintColor,
              widget.secondaryColor,
              widget.mainWidth,
              widget.secondaryWidth,
            ),
          ),
        );
      },
    );
  }
}

class _MyRadialProgressPainter extends CustomPainter {
  final porcentaje;
  final Color tintColor;
  late Color secondaryColor;
  late double mainWidth;
  late double secondaryWidth;

  _MyRadialProgressPainter(
    this.porcentaje,
    this.tintColor,
    this.secondaryColor,
      this.mainWidth,
      this.secondaryWidth,
  );

  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(center: Offset(0,0), radius: 180);

    final Gradient gradient = LinearGradient(
        colors: [
          Color(0xffc012ff),
          Color(0xff6d05e8),
          Colors.red,
        ],
    );

    final paint = Paint()
      ..strokeWidth = secondaryWidth
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height / 2.0);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Arco:
    final arcPaint = Paint()
      ..strokeWidth = mainWidth
      //..color = tintColor
    ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
