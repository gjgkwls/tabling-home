import 'package:flutter/material.dart';
import 'package:tablin_home/widgets/curation_item_widget.dart';

class CurationInfoWidget extends StatelessWidget {
  const CurationInfoWidget({
    super.key,
    required this.curationList,
  });

  final List<String> curationList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                '원격줄서기 인기 매장 BEST',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text(
                    '서울 남부',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Image.asset(
                    'assets/icons/indicator_down.png',
                    alignment: Alignment.center,
                    width: 18,
                    height: 18,
                  ),
                ],
              ),
              GridView.builder(
                physics: const ScrollPhysics(),
                padding: const EdgeInsets.only(top: 20),
                itemCount: 9,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.8 / 1,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                ),
                itemBuilder: (context, index) {
                  if (index > 8) {
                    return null;
                  } else if (index == 8) {
                    return const CurationItem(itemTitle: '지역 더보기');
                  }
                  return CurationItem(itemTitle: curationList[index]);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24),
                child: Image.asset('assets/images/packing_order.png'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
