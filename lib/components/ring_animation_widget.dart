import 'dart:math' as math;

import 'package:chakrasample/painter/ring_painter.dart';
import 'package:flutter/material.dart';

/*
*   先にPainterを実装してからここを実装すること
*
* */

class RingAnimationWidget extends StatefulWidget {
  @override
  _RingAnimationWidgetState createState() => _RingAnimationWidgetState();
}

//AnimationControllerを２つの場合はTickerProviderStateMixin」の方
//https://flutter.dev/docs/development/ui/animations/tutorial
//https://api.flutter.dev/flutter/animation/AnimationController-class.html
class _RingAnimationWidgetState extends State<RingAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _circleAnimController;

  @override
  void initState() {
    super.initState();
    _circleAnimController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _circleAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //RadialGradient（円形グラデーション）=> まずは無しでやろう
        //https://api.flutter.dev/flutter/painting/RadialGradient-class.html
        //https://www.weblio.jp/content/%E5%86%86%E5%BD%A2%E3%82%B0%E3%83%A9%E3%83%87%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3
        gradient: RadialGradient(
          colors: [
            Colors.orange[800]!.withOpacity(0.5),
            Colors.black.withOpacity(0.2),
          ],
        ),
      ),
      child: Center(
        //AspectRatio => イランわ
        //https://api.flutter.dev/flutter/widgets/AspectRatio-class.html
        child: CustomPaint(
          painter: RingPainter(
            circleAnimation: CurvedAnimation(
              parent: _circleAnimController,
              curve: Curves.ease,
            ),
            count: 7
          ),
          size: Size.infinite,
        ),
      ),
    );
  }
}

