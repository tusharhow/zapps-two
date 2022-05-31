import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../data/frog.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

final List<Frog> all = allAnimals;
final List<Frog> one = [];
final List<Frog> two = [];
final List<Frog> three = [];
final List<Frog> four = [];

void removeAll(Frog? toRemove) {
  all.removeWhere((animal) => animal.imageUrl == toRemove!.imageUrl);
  one.removeWhere((animal) => animal.imageUrl == toRemove!.imageUrl);
  two.removeWhere((animal) => animal.imageUrl == toRemove!.imageUrl);
  three.removeWhere((animal) => animal.imageUrl == toRemove!.imageUrl);
  four.removeWhere((animal) => animal.imageUrl == toRemove!.imageUrl);
}

int score = 0;

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: Image.asset(
              "assets/images/main.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: 40,
            right: 30,
            child: Text(
              "Score: $score",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 60,
            child: Column(
              children: [
                // buildTarget(
                //   context,
                //   text: 'All',
                //   animals: all,
                //   acceptTypes: AnimalType.values,
                //   onAccept: (data) => setState(() {
                //     removeAll(data);
                //     all.add(data);
                //   }),
                // ),
                // Container(
                //   height: 210,
                //   width: 250,
                //   color: Colors.red,
                // ),
                SizedBox(
                  height: 250,
                  width: 500,
                  child: GridView.builder(
                      itemCount: all.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (context, index) {
                        var data = [all[index]];

                        return Container(
                          margin: EdgeInsets.all(10),
                          child: buildTarget(
                            context,
                            // text: all[index]
                            //     .type
                            //     .toString()
                            //     .replaceAll('AnimalType.', ''),
                            text: '',
                            animals: data,
                            acceptTypes: AnimalType.values,
                            onAccept: (data) => setState(() {
                              removeAll(data);
                              all.add(data);
                            }),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          Positioned(
            left: 70,
            top: 215,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildTarget(
                      context,
                      text: '1',
                      animals: one,
                      acceptTypes: [AnimalType.one],
                      onAccept: (data) => setState(() {
                        one.remove(data);
                        one.add(data);
                      }),
                    ),
                    const SizedBox(width: 20),
                    buildTarget(
                      context,
                      text: '2',
                      animals: two,
                      acceptTypes: [AnimalType.two],
                      onAccept: (data) => setState(() {
                        removeAll(data);
                        two.add(data);
                      }),
                    ),
                    const SizedBox(width: 20),
                    buildTarget(
                      context,
                      text: '3',
                      animals: three,
                      acceptTypes: [AnimalType.three],
                      onAccept: (data) => setState(() {
                        removeAll(data);
                        three.add(data);
                      }),
                    ),
                    const SizedBox(width: 20),
                    buildTarget(
                      context,
                      text: '4',
                      animals: four,
                      acceptTypes: [AnimalType.four],
                      onAccept: (data) => setState(() {
                        removeAll(data);
                        four.add(data);
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Positioned(
          //   left: 70,
          //   top: 550,
          //   child: Row(
          //     children: [
          //       buildTarget(
          //         context,
          //         text: '3',
          //         animals: three,
          //         acceptTypes: [AnimalType.three],
          //         onAccept: (data) => setState(() {
          //           removeAll(data);
          //           three.add(data);
          //         }),
          //       ),
          //       const SizedBox(width: 20),
          //       buildTarget(
          //         context,
          //         text: '4',
          //         animals: four,
          //         acceptTypes: [AnimalType.four],
          //         onAccept: (data) => setState(() {
          //           removeAll(data);
          //           four.add(data);
          //         }),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildTarget(
    BuildContext context, {
    required String text,
    required List<Frog> animals,
    required List<AnimalType> acceptTypes,
    required DragTargetAccept<Frog> onAccept,
  }) =>
      DottedBorder(
        color: Colors.green,
        strokeWidth: 1,
        dashPattern: const [
          10,
          10,
        ],
        child: Container(
          height: 135,
          width: 100,
          color: Colors.white,
          child: DragTarget<Frog>(
            builder: (context, candidateData, rejectedData) => Stack(
              children: [
                ...animals
                    .map(
                      (animal) => DraggableWidget(animal: animal),
                    )
                    .toList(),
                IgnorePointer(
                  child: Center(
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onWillAccept: (data) => true,
            onAccept: (data) {
              if (acceptTypes.contains(data.type)) {
                print('correct');
                setState(() {
                  score += 10;
                  all.removeWhere((animal) => animal.imageUrl == data.imageUrl);
                });
              } else {
                setState(() => score -= 20);
                print('wrong');
              }
              onAccept(data);
            },
          ),
        ),
      );
}

class DraggableWidget extends StatelessWidget {
  final Frog animal;

  const DraggableWidget({
    Key? key,
    required this.animal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Draggable<Frog>(
        data: animal,
        feedback: buildImage(),
        childWhenDragging: buildImage(),
        child: buildImage(),
      );

  Widget buildImage() => Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(
            animal.imageUrl,
            height: 150,
            width: 130,
          ),
        ),
      );
}
