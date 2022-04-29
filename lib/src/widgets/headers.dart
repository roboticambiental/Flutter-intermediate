import 'package:flutter/material.dart';

class SquareHeader extends StatelessWidget {
  const SquareHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615aab),
    );
  }
}

class BottomRoundedHeader extends StatelessWidget {
  const BottomRoundedHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615aab),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70)
        )
      ),
    );
  }
}

class DiagonalHeader extends StatelessWidget {
  const DiagonalHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: DiagonalHeaderPainter(),
      ),
    );
  }
}

class DiagonalHeaderPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    final pencil = Paint();
    pencil.color = Color(0xff615aab);
    //pencil.style = PaintingStyle.stroke;
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 5;

    final path = Path();

    // Draw with the pencil and path:
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, pencil);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}

class TriangularHeader extends StatelessWidget {
  const TriangularHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _TriangularCustomPainter(),
      ),
    );
  }
}

class _TriangularCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = Color(0xff615aab);
    paint.strokeWidth = 5;

    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}

class BeakHeader extends StatelessWidget {
  const BeakHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _BeakHeaderPainter(),
      ),
    );
  }
}

class _BeakHeaderPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = Color(0xff615aab);
    paint.strokeWidth = 5;

    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.28);
    path.lineTo(size.width * 0.5, size.height * 0.35);
    path.lineTo(0, size.height * 0.28);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}

class CurvedHeader extends StatelessWidget {
  const CurvedHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _CurvedHeaderPainter(),
      ),
    );
  }
}

class _CurvedHeaderPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = Color(0xff615aab);
    paint.strokeWidth = 5;

    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.35, 0, size.height * 0.25);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}

class WaveHeader extends StatelessWidget {
  const WaveHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _WaveHeaderPainter(),
      ),
    );
  }
}

class _WaveHeaderPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    final rect = Rect.fromCircle(
        center: Offset(55.0, 55.0),
        radius: 180
    );
    final gradient = LinearGradient(
        colors: [
          Color(0xff6d05e8),
          Color(0xffc012ff),
          Color(0xff6d05fa)
        ],
      begin: FractionalOffset(0.2,0.0),
      end: FractionalOffset(1.0,0.6),
      stops: [
        0.2,
        0.5,
        1.0
      ]
    );

    final paint = Paint()..shader = gradient.createShader(rect);
    paint.style = PaintingStyle.fill;
    //paint.color = Color(0xff615aab);
    paint.strokeWidth = 5;

    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.35);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.3, size.width * 0.5, size.height * 0.35);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.40, 0, size.height * 0.35);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}


