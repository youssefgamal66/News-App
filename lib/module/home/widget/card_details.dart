import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:news/core/routes/app_routes_name.dart';
import '../../../core/theme/app_color.dart';
import '../../card/pages/card_screen.dart';
import 'card_list.dart';

class CardDetails extends StatelessWidget {
  final CardList card;
  final int index;
  final bool isReversed;

  const CardDetails({
    super.key,
    required this.card,
    required this.index,
    this.isReversed = false,
  });

  @override
  Widget build(BuildContext context) {
    final image = ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Image.asset(
        card.photo!,
        width: 180,
        height: 180,
        fit: BoxFit.cover,
      ),
    );

    final content = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
        isReversed ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            card.name ?? "",
            style: const TextStyle(
              color: AppColor.black,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 40),
          Directionality(
            textDirection: isReversed ? TextDirection.rtl : TextDirection.ltr,
            child: AnimatedToggleSwitch.dual(
              current: false,
              first: false,
              second: true,
              spacing: 50.0,
              style: const ToggleStyle(
                backgroundColor: Colors.grey,
                indicatorColor: Colors.black,
                borderColor: Colors.transparent,
              ),
              iconBuilder: (value) {
                return const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                );
              },
              textBuilder: (value) {
                return const Text('View All');
              },
              onChanged: (value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext newContext) {
                      return CardScreen(
                        cardList: CardList.iteam[index],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );

    return Container(
      margin: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: isReversed
            ? [content, const SizedBox(width: 20), image]
            : [image, const SizedBox(width: 20), content],
      ),
    );
  }
}
