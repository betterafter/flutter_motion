import 'package:flutter/material.dart';

/// 앞으로 이동하면 점점 커지면서 사라지는 카드 모션.
class CardWidget extends StatelessWidget {
  final Offset position;
  final Widget child;
  final double width;
  final double height;

  const CardWidget({
    super.key,
    required this.child,
    required this.position,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final startPoint = MediaQuery.of(context).size.height * 0.4;

    return Positioned(
      top: position.dy,
      // 너비는 맨 바깥쪽 카드를 화면의 1/2로, 맨 바깥을 화면의 너비만큼으로 해서
      // 4개의 카드만 노출되게 하여 크기를 균등하게 분배한다.
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
      ),
    );
  }
}
