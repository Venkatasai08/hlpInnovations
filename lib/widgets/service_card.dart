import 'package:flutter/material.dart';
import 'package:hlpinnovations/common/common.dart';
import 'package:hlpinnovations/models/model.dart';
import 'package:hlpinnovations/screens/screens.dart';
import 'package:hlpinnovations/utils/utils.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.petCenter});

  final PetCenter petCenter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utils().navigateWithAnimation(
          context: context,
          nextPage: PetCenterDetailScreen(petCenter: petCenter),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 5),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                BackgroundImageWidget(image: petCenter.image, height: 200),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: petCenter.isOpen ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      petCenter.isOpen ? "Opened" : "Closed",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "${petCenter.rating}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.star, color: Colors.white, size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    petCenter.name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  Wrap(
                    runSpacing: 5,
                    children: [
                      Text(
                        "Services:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      for (int i = 0; i < petCenter.services.length; i++)
                        Text(
                          " ${i + 1}) ${petCenter.services.keys.toList()[i]} ",
                          style: TextStyle(fontSize: 18),
                        ),
                    ],
                  ),

                  Wrap(
                    runSpacing: 5,
                    children: [
                      Text(
                        "Pets Supported:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      for (int i = 0; i < petCenter.petTypes.length; i++)
                        Text(
                          " ${i + 1}) ${petCenter.petTypes[i]} ",
                          style: TextStyle(fontSize: 18),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
