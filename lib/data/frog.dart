enum AnimalType { one, two, three, four }

class Frog {
  final String imageUrl;
  final AnimalType type;

  Frog({
    required this.imageUrl,
    required this.type,
  });
}

final allAnimals = [
  Frog(
    type: AnimalType.one,
    imageUrl: 'assets/images/frog1.png',
  ),
  Frog(
    type: AnimalType.two,
    imageUrl: 'assets/images/frog2.png',
  ),
  Frog(
    type: AnimalType.three,
    imageUrl: 'assets/images/frog3.png',
  ),
  Frog(
    type: AnimalType.four,
    imageUrl: 'assets/images/frog4.png',
  ),
  // Animal(
  //   type: AnimalType.air,
  //   imageUrl: 'assets/images/frog1.png',
  // ),
  // Animal(
  //   type: AnimalType.land,
  //   imageUrl: 'assets/images/frog1.png',
  // ),
];
