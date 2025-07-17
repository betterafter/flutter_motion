import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_motion/src/cards/card_set.widget.dart';

/// 카드 4장씩 한세트로 움직이게 함
class CardListWidget extends StatefulWidget {
  final List<Image> cards;

  const CardListWidget({super.key, required this.cards});

  @override
  State<CardListWidget> createState() => _CardListWidgetState();
}

class _CardListWidgetState extends State<CardListWidget> {
  final startPosition = ValueNotifier<Offset>(Offset(0, 0));
  final prevY = ValueNotifier<double>(0);
  final currY = ValueNotifier<double>(0);
  final currentIndex = ValueNotifier<int>(0);
  bool panUpdated = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (panUpdated) {
          return;
        }

        if (details.delta.dy > 3) {
          currentIndex.value++;
          panUpdated = true;
        } else if (details.delta.dy < -3) {
          currentIndex.value--;
          panUpdated = true;
        }
      },
      onPanEnd: (details) {
        panUpdated = false;
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: ValueListenableBuilder(
          valueListenable: startPosition,
          builder: (context, value, child) {
            return Stack(
              children: [
                ..._buildCardList(widget.cards),
              ],
            );
          },
        ),
      ),
    );
  }

  /// 카드 리스트를 4분할해서 카드세트를 만들어서 CardSetWidget에 4장의 카드로 묶어서 반환
  List<Widget> _buildCardList(List<Image> cards) {
    var length = cards.length / 4;
    var cardSet = <Widget>[];

    for (var i = length.toInt() - 1; i >= 0; i--) {
      cardSet.addAll(cards.sublist(i * 4, (i + 1) * 4).mapIndexed(
            (index, e) => CardSetWidget(
              cards: cards.sublist(i * 4, (i + 1) * 4),
              index: i,
              selectedIndex: currentIndex.value,
            ),
          ));
    }

    return cardSet.toList();
  }
}
