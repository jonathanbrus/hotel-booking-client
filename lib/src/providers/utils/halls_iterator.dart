import '../../models/hall.dart';

List<Hall> iterateHalls(List halls) {
  return [
    ...halls.map(
      (hall) => Hall(
        name: hall["name"],
        description: hall["description"],
        images: hall["images"],
        state: hall["state"],
        city: hall["city"],
        detailAddress: hall["detailAddress"],
        distance: hall["distance"],
        venueType: hall["venueType"],
        mainHall: hall["mainHall"],
        diningHall: hall["diningHall"],
        decorAndRitual: hall["decorAndRitual"],
        parking: hall["parking"],
        raing: hall["raing"],
      ),
    ),
  ];
}
