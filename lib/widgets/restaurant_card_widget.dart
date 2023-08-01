import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.leading,
    required this.info,
  });

  final Widget leading;
  final Widget info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          leading,
          const SizedBox(
            width: 12,
          ),
          info,
        ],
      ),
    );

    // return ListTile(
    //   leading: leading,
    //   title: info,
    //   contentPadding: const EdgeInsets.symmetric(
    //     vertical: 12,
    //   ),
    //   horizontalTitleGap: 12,
    //   minVerticalPadding: 0,
    // );
  }
}
