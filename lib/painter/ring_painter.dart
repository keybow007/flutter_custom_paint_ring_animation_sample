import 'dart:math' as math;

import 'package:flutter/material.dart';

class RingPainter extends CustomPainter {
  final Animation<double> circleAnimation;
  final int count;
  final Paint circlePaint;

  RingPainter({
    this.circleAnimation,
    this.count,
  })  : circlePaint = Paint()
          //PaintingStyle: fillは塗りつぶし、strokeは輪郭のみ
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5
          ..color = Colors.orange[700]
          ..blendMode = BlendMode.screen,
        super(repaint: circleAnimation);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final center = size.center(Offset.zero);
    final radius = (size.shortestSide * 0.30) * circleAnimation.value;

    canvas.drawCircle(
      center,
      circleAnimation.value * radius / 1.22,
      circlePaint,
    );

    //円周＝直径（radius）☓円周率（π：pi）
    for (int index = 0; index < count; index++) {
      /*
      *   ラジアン角を求めている（弧度法）
      *   https://atarimae.biz/archives/18037
      *   360°＝２πラジアン（rad）
      * */
      final indexAngle = (index * math.pi / count * 2);
      //final angle = indexAngle + (math.pi * 1.43);
      //final offset = Offset(math.sin(angle), math.cos(angle)) * radius * 0.99;
      final offset =
          Offset(math.sin(indexAngle), math.cos(indexAngle)) * radius * 0.99;
      canvas.drawCircle(
        center + offset * circleAnimation.value,
        radius / 3,
        circlePaint,
      );
    }
  }

  //引数の型をCustomPainterからChakraPainterに変更(使い方：StackOverflow）
  //https://api.flutter.dev/flutter/rendering/CustomPainter/shouldRepaint.html
  //https://stackoverflow.com/questions/56370921/when-is-shouldrepaint-method-from-custom-painter-class-in-flutter-called
  @override
  //bool shouldRepaint(CustomPainter oldDelegate) {
  bool shouldRepaint(RingPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return circleAnimation != oldDelegate.circleAnimation;
  }
}
