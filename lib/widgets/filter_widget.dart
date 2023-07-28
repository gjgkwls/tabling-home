import 'package:flutter/material.dart';

class HomeFilter extends StatelessWidget {
  const HomeFilter({
    super.key,
    required this.filterTitle,
    required this.isTimeSale,
  });

  final String filterTitle;
  final bool isTimeSale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onFilterTap(context);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        height: 33,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: const Color(0xffD5DDE7),
            width: 0.7,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isTimeSale) Image.asset('assets/icons/timesale_clock.png'),
            if (isTimeSale)
              const SizedBox(
                width: 3,
              ),
            Text(
              filterTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 1,
                fontSize: 13,
                color: Color(0xff454A52),
              ),
            ),
            if (!isTimeSale)
              const SizedBox(
                width: 3,
              ),
            if (!isTimeSale)
              Image.asset('assets/icons/indicator_down_gray.png'),
          ],
        ),
      ),
    );
  }

  Future<void> onFilterTap(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: double.infinity,
          height: 1800,
          // color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              right: 10,
            ),
            child: IconButton(
              alignment: Alignment.topRight,
              icon: const Icon(
                Icons.cancel_sharp,
                color: Color(0xff5C83B6),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        );
      },
    );
  }
}
