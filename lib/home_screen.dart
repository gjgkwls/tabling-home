import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tablin_home/models/restaurant_model.dart';
import 'package:tablin_home/widgets/banner_widget.dart';
import 'package:tablin_home/widgets/curation_info_widget.dart';
import 'package:tablin_home/widgets/home_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bannerList = ['banner_1.png', 'banner_2.png', 'banner_3.png'];
  final curationList = [
    "강남역/역삼",
    "압구정/청담",
    "가로수길",
    "잠실/방이",
    "송리단길",
    "사당/이수",
    "문래/영등포",
    "선릉/삼성",
    "논현",
    "서초/방배",
    "서울대/신림",
    "여의도",
    "문정/가락",
    "강서/마곡",
    "강동",
    "목동/구로",
  ];
  late Future<List<RestaurantModel>> lists = getRestaurantList();

  int _currentPageIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPageIndex < bannerList.length - 1) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
        _pageController.jumpToPage(_currentPageIndex);
      }

      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BannerWidget(
                  pageController: _pageController, bannerList: bannerList),
              CurationInfoWidget(curationList: curationList),
              const SizedBox(
                height: 8,
                width: double.infinity,
                child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xffF3F5FA))),
              ),
              HomeList(lists: lists),
            ],
          ),
        ),
      ),
    );
  }

  // ListView makeRestaurautList(AsyncSnapshot<List<RestaurantModel>> snapshot) {
  //   return ListView.builder(
  //     physics: const ScrollPhysics(),
  //     padding: const EdgeInsets.symmetric(vertical: 10),
  //     shrinkWrap: true,
  //     itemCount: snapshot.data?.length,
  //     itemBuilder: (context, index) {
  //       return RestaurantCard(restaurant: snapshot.data![index]);
  //     },
  //   );
  // } // 그닥 좋지 않은 방법
  // 메소드로 만들면 setState할 때마다 다시 불러와서 그냥 위젯으로 하는게 좋은 방법이야

  Future<List<RestaurantModel>> getRestaurantList() async {
    final jsonString =
        await rootBundle.loadString('assets/json/sample_data.json');
    final jsonResponse = json.decode(jsonString);
    List<RestaurantModel> lists = [];
    for (var item in jsonResponse) {
      final instance = RestaurantModel.fromJson(item);
      print(instance.restaurantName);
      lists.add(instance);
    }

    return lists;
  }
}
