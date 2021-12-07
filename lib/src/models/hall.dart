class Hall {
  final String name;
  final String description;
  final List<String> images;
  final String state;
  final String city;
  final String detailAddress;
  final double distance;
  final String venueType;
  final MainHall mainHall;
  final DiningHall diningHall;
  // final Rooms rooms;
  final DecorAndRitual decorAndRitual;
  final Parking parking;
  final double raing;

  Hall({
    required this.name,
    required this.description,
    required this.images,
    required this.state,
    required this.city,
    required this.detailAddress,
    required this.distance,
    required this.venueType,
    required this.mainHall,
    required this.diningHall,
    // required this.rooms,
    required this.decorAndRitual,
    required this.parking,
    required this.raing,
  });
}

class MainHall {
  final bool ac;
  final int seatingCapacity;
  final int floatingCapacity;

  MainHall({
    required this.ac,
    required this.seatingCapacity,
    required this.floatingCapacity,
  });
}

class DiningHall {
  final bool ac;
  final int seatingCapacity;
  final _FoodService foodAndService;

  DiningHall({
    required this.ac,
    required this.seatingCapacity,
    required this.foodAndService,
  });
}

class _FoodService {
  final bool allowOtherVendor;
  final bool allowNonVeg;
  final bool buffetCrockeryAvilable;

  _FoodService({
    required this.allowOtherVendor,
    required this.allowNonVeg,
    required this.buffetCrockeryAvilable,
  });
}

// class Rooms {
//   final bool ac;
//   final int noOfRooms;
//   final int noOfAcRooms;

//   Rooms({
//     required this.ac,
//     required this.noOfRooms,
//     required this.noOfAcRooms,
//   });
// }

class DecorAndRitual {
  final bool allowOtherVendor;
  final bool allowHomam;

  DecorAndRitual({
    required this.allowOtherVendor,
    required this.allowHomam,
  });
}

class Parking {
  final bool available;
  final int car;
  final int bike;

  Parking({
    required this.available,
    required this.car,
    required this.bike,
  });
}
