import 'package:flutter/material.dart';
import 'package:tablin_home/models/restaurant_model.dart';
import 'package:tablin_home/widgets/filter_widget.dart';
import 'package:tablin_home/widgets/restaurant_card_widget.dart';
import 'package:tablin_home/widgets/restaurant_info_widget.dart';
import 'package:tablin_home/widgets/restaurant_thumb_widget.dart';

class HomeList extends StatelessWidget {
  const HomeList({
    super.key,
    required this.lists,
  });

  final Future<List<RestaurantModel>> lists;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                final String filterTitle =
                    index == 0 ? '타임세일' : (index == 1 ? '가까운 순' : '전체 거리');
                return HomeFilter(
                  filterTitle: filterTitle,
                  isTimeSale: index == 0,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemCount: 3,
            ),
          ),
          FutureBuilder(
            future: lists,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  physics: const ScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    final restaurant = snapshot.data![index];
                    return RestaurantCard(
                      leading: ThumbWidget(
                        thumbnail: restaurant.thumbnail,
                        waitingCount: restaurant.waitingCount,
                      ),
                      info: RestaurantInfo(
                        restaurant: restaurant,
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
