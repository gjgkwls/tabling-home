import 'package:flutter/material.dart';

class ThumbWidget extends StatelessWidget {
  const ThumbWidget({
    super.key,
    required this.thumbnail,
    required this.waitingCount,
  });

  final String thumbnail;
  final int waitingCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88,
      height: 100,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              thumbnail,
              fit: BoxFit.cover,
              width: 88,
              height: 100,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: 26,
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 6),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6),
                  bottomLeft: Radius.circular(6),
                ),
                color: Color(0xBF090D12),
              ),
              child: Text(
                waitingCount == 0 ? '대기 없음' : '대기 $waitingCount팀',
                style: const TextStyle(
                    fontSize: 12,
                    height: 1,
                    color: Color(0xffF9F9FA),
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
