import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tablin_home/models/restaurant_model.dart';
import 'package:tablin_home/widgets/banner_widget.dart';
import 'package:tablin_home/widgets/curation_info_widget.dart';
import 'package:tablin_home/widgets/filter_widget.dart';
import 'package:tablin_home/widgets/restaurant_card_widget.dart';

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
  final Future<List<RestaurantModel>> lists = getRestaurantList();

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
      body: SingleChildScrollView(
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      '주변 맛집 다 모여라!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                    height: 33,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final String filterTitle = index == 0
                            ? '타임세일'
                            : (index == 1 ? '가까운 순' : '전체 거리');
                        return HomeFilter(
                          filterTitle: filterTitle,
                          isTimeSale: index == 0,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                      itemCount: 3,
                    ),
                  ),
                  FutureBuilder(
                    future: lists,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return makeRestaurautList(snapshot);
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView makeRestaurautList(AsyncSnapshot<List<RestaurantModel>> snapshot) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 10),
      shrinkWrap: true,
      itemCount: snapshot.data?.length,
      itemBuilder: (context, index) {
        return RestaurantCard(restaurant: snapshot.data![index]);
      },
    );
  }

  static Future<List<RestaurantModel>> getRestaurantList() async {
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
