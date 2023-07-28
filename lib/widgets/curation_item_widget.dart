import 'package:flutter/material.dart';

class CurationItem extends StatelessWidget {
  const CurationItem({
    super.key,
    required this.itemTitle,
  });

  final String itemTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: const Color(0xffD4D9E7),
          width: 0.6,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            itemTitle,
            style: const TextStyle(
              color: Color(0xff474E5C),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Image.asset(
            'assets/icons/indicator_right.png',
            alignment: Alignment.center,
            width: 8,
            height: 8,
          )
        ],
      ),
    );
  }
}
