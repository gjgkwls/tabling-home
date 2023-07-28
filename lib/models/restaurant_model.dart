class RestaurantModel {
  final int restaurantIdx;
  final String thumbnail;
  final String classification;
  final String restaurantName;
  final double rating;
  final int reviewCount;
  final String summaryAddress;
  final bool isQuickBooking;
  final bool isRemoteWaiting;
  final bool isTakeOut;
  final bool isOnSiteOrder;
  final bool useWaiting;
  final bool useBooking;
  final bool isNew;
  final int waitingCount;
  final String distance;

  RestaurantModel.fromJson(Map<String, dynamic> json)
      : restaurantIdx = json["restaurantIdx"],
        thumbnail = json["thumbnail"],
        classification = json["classification"],
        restaurantName = json["restaurantName"],
        rating = (json['rating'] as num).toDouble(),
        reviewCount = json["reviewCount"],
        summaryAddress = json["summaryAddress"],
        isQuickBooking = json["isQuickBooking"],
        isRemoteWaiting = json["isRemoteWaiting"],
        isTakeOut = json["isTakeOut"],
        isOnSiteOrder = json["isOnSiteOrder"],
        useWaiting = json["useWaiting"],
        useBooking = json["useBooking"],
        waitingCount = json["waitingCount"],
        isNew = json["isNew"],
        distance = json["distance"];
}
