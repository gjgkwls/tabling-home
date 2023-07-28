import 'package:flutter/material.dart';
import 'package:tablin_home/models/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  RestaurantCard({
    super.key,
    required this.restaurant,
  });

  final RestaurantModel restaurant;

  late final List<Map<String, dynamic>> tagList = [
    {'enabled': restaurant.isQuickBooking, 'name': '즉시예약'},
    {'enabled': restaurant.isRemoteWaiting, 'name': '원격줄서기'},
    {'enabled': restaurant.isOnSiteOrder, 'name': '현장주문'},
    {'enabled': restaurant.isTakeOut, 'name': '포장'},
  ];

  @override
  Widget build(BuildContext context) {
    var filteredTagList = tagList
        .where((tag) => tag['enabled'])
        .map((tag) => tag['name'])
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  restaurant.thumbnail,
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 6),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                    ),
                    color: Color(0xBF090D12),
                  ),
                  child: Text(
                    restaurant.waitingCount == 0
                        ? '대기 없음'
                        : '대기 ${restaurant.waitingCount}팀',
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
          const SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.restaurantName,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff131517),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_rounded,
                    size: 16,
                    color: Colors.yellow.shade700,
                  ),
                  Text(
                    restaurant.rating.toString(),
                    style: const TextStyle(
                      height: 1,
                      fontSize: 13,
                      color: Color(0xff131517),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "(${restaurant.reviewCount >= 300 ? '300+' : restaurant.reviewCount.toString()})",
                    style: const TextStyle(
                      height: 1,
                      fontSize: 13,
                      color: Color(0xff131517),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                '${restaurant.classification} · ${restaurant.summaryAddress} · ${restaurant.distance}',
                style: const TextStyle(
                  height: 1,
                  fontSize: 13,
                  color: Color(0xff96A0AC),
                ),
              ),
              const SizedBox(
                height: 8.5,
              ),
              SizedBox(
                height: 19,
                child: ListView.separated(
                  itemCount: filteredTagList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: const Color(0xffEFF6FF),
                      ),
                      child: Text(
                        filteredTagList[index].toString(),
                        style: const TextStyle(
                            color: Color(0xff537CAF),
                            fontSize: 9,
                            height: 1,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 4,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
