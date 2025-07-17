import 'package:flutter/material.dart';
import 'package:flutter_motion/flutter_motion.dart';
import 'package:collection/collection.dart';

class CardSetWidget extends StatefulWidget {
  final List<Image> cards;
  final int selectedIndex;
  final int index;

  const CardSetWidget({
    super.key,
    required this.cards,
    required this.selectedIndex,
    required this.index,
  });

  @override
  State<CardSetWidget> createState() => _CardSetWidgetState();
}

class _CardSetWidgetState extends State<CardSetWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100000),
    )..forward();

    _animation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, 10),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    final startPoint = MediaQuery.of(context).size.height * 0.7;

    return SlideTransition(
      position: _animation,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ...widget.cards.mapIndexed(
            (index, e) {
              // 맨 앞에, startPoint에 있으면 화면 너비만큼의 너비를 갖고, 그렇지 않으면
              // 비율에 따라 작아진다.

              final width = MediaQuery.of(context).size.width / 2;
              final height = MediaQuery.of(context).size.height / 3;

              return CardWidget(
                width: width,
                height: height,
                position: widget.index == widget.selectedIndex
                    ? Offset(0, startPoint - 50 * (widget.cards.length - index))
                    : Offset(0, startPoint - 200),
                child: e,
              );
            },
          ),
        ],
      ),
    );
  }
}
