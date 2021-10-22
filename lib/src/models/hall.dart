class Hall {
  final String name;
  final String description;
  final List<String> images;
  final String state;
  final String city;
  final String detailAddress;
  final double distance;
  final String venueType;
  final _MainHall mainHall;
  final _DiningHall diningHall;
  final _Rooms rooms;
  final _DecorAndRitual decorAndRitual;
  final _Parking parking;
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
    required this.rooms,
    required this.decorAndRitual,
    required this.parking,
    required this.raing,
  });
}

class _MainHall {
  final bool ac;
  final int seatingCapacity;
  final int floatingCapacity;

  _MainHall({
    required this.ac,
    required this.seatingCapacity,
    required this.floatingCapacity,
  });
}

class _DiningHall {
  final bool ac;
  final int seatingCapacity;
  final String hallLevel;
  final _FoodService foodAndService;

  _DiningHall({
    required this.ac,
    required this.seatingCapacity,
    required this.hallLevel,
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

class _Rooms {
  final bool ac;
  final int noOfRooms;
  final int noOfAcRooms;

  _Rooms({
    required this.ac,
    required this.noOfRooms,
    required this.noOfAcRooms,
  });
}

class _DecorAndRitual {
  final bool allowOtherVendor;
  final bool allowHomam;

  _DecorAndRitual({
    required this.allowOtherVendor,
    required this.allowHomam,
  });
}

class _Parking {
  final bool available;
  final int car;
  final int bike;

  _Parking({
    required this.available,
    required this.car,
    required this.bike,
  });
}
