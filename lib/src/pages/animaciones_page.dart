import 'package:flutter/material.dart';
import 'dart:math';

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return AnimatedSquare();
    return Scaffold(
      body: Container(
        child: Center(
          child: AnimatedSquare2(),
        ),
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({Key? key}) : super(key: key);

  @override
  State<AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> moveToRight;
  late Animation<double> grow;
  late Animation<double> opacityOut;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 4000)
    );

    // Animación lineal:
    //rotation = Tween(begin: 0.0, end: 2.0 * pi ).animate(controller);
    rotation = Tween(begin: 0.0, end: 2.0 * pi ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    //opacity = Tween(begin: 0.1, end: 1.0 ).animate(controller);
    opacity = Tween(begin: 0.1, end: 1.0 ).animate(
        CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.easeOut))
    );

    moveToRight = Tween(begin: 0.0, end: 200.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    grow = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    opacityOut = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.easeOut))
    );

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed){
        controller.reverse();
      }
    });

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward();
    
    return AnimatedBuilder(
        animation: controller,
        child: _Rectangle(),
        builder: (BuildContext context, Widget? child){
          return Transform.translate(
              offset: Offset(moveToRight.value, 0),
            child: Transform.rotate(
              angle: rotation.value,
              child: Transform.scale(
                scale: grow.value,
                child: Opacity(
                  opacity: opacityOut.value,
                  child: Opacity(
                    opacity: opacity.value,
                    child: child,
                  ),
                )
              )
            ),
          );
        }
    );

  }

}

class AnimatedSquare2 extends StatefulWidget {
  const AnimatedSquare2({Key? key}) : super(key: key);

  @override
  State<AnimatedSquare2> createState() => _AnimatedSquareState2();
}

class _AnimatedSquareState2 extends State<AnimatedSquare2> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> moveToRight;
  late Animation<double> moveUp;
  late Animation<double> moveLeft;
  late Animation<double> moveDown;
  late Animation<double> grow;
  late Animation<double> opacityOut;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 4000)
    );

    // Animación lineal:
    //rotation = Tween(begin: 0.0, end: 2.0 * pi ).animate(controller);
    rotation = Tween(begin: 0.0, end: 2.0 * pi ).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    //opacity = Tween(begin: 0.1, end: 1.0 ).animate(controller);
    opacity = Tween(begin: 0.1, end: 1.0 ).animate(
        CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.easeOut))
    );

    moveToRight = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.bounceOut))
    );

    moveUp = Tween(begin: 0.0, end: -100.0).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.25, 0.5, curve: Curves.bounceOut))
    );

    moveLeft = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.5, 0.75, curve: Curves.bounceOut))
    );

    moveDown = Tween(begin: 0.0, end: -100.0).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.bounceOut))
    );

    grow = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    opacityOut = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.easeOut))
    );

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed){
        controller.reverse();
      }
    });

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward();

    return AnimatedBuilder(
        animation: controller,
        child: _Rectangle(),
        builder: (BuildContext context, Widget? child){
          return Transform.translate(
            offset: Offset(moveToRight.value - moveLeft.value, moveUp.value - moveDown.value),
            child: Transform.rotate(
                angle: rotation.value,
                child: Transform.scale(
                    scale: grow.value,
                    child: Opacity(
                      opacity: opacityOut.value,
                      child: Opacity(
                        opacity: opacity.value,
                        child: child,
                      ),
                    )
                )
            ),
          );
        }
    );

  }

}

class _Rectangle extends StatelessWidget {
  const _Rectangle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.blue
      ),
      child: Center(
        child: Text("hello"),
      ),
    );
  }
}

