import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
    required PageController pageController,
    required this.bannerList,
  }) : _pageController = pageController;

  final PageController _pageController;
  final List<String> bannerList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: SizedBox(
        height: 136,
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          itemCount: bannerList.length,
          itemBuilder: (context, index) {
            return Image.asset(
              'assets/images/${bannerList[index]}',
              fit: BoxFit.fill,
            );
          },
        ),
      ),
    );
  }
}
