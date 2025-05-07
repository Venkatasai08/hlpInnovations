import 'package:flutter/material.dart';
import 'package:hlpinnovations/common/common.dart';
import 'package:hlpinnovations/models/model.dart';

class PetCenterDetailScreen extends StatelessWidget {
  final PetCenter petCenter;
  const PetCenterDetailScreen({super.key, required this.petCenter});

  @override
  Widget build(BuildContext context) {
    Widget backButton() {
      return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back, color: Colors.white),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            expandedHeight: 350,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              titlePadding: EdgeInsets.all(0),

              background: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                      child: Image.asset(
                        "assets/images/blueBg.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            const Color.fromARGB(43, 0, 0, 0),
                            const Color.fromARGB(171, 0, 0, 0),
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [backButton()],
                          ),
                          Hero(
                            tag: petCenter.image,
                            child: ClipOval(
                              child: Image.asset(petCenter.image, height: 150),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            petCenter.name,
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          SizedBox(height: 5),

                          Text(
                            petCenter.location,
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    petCenter.rating.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.white,
                                height: 50,
                                width: 2,
                              ),
                              Text(
                                petCenter.isOpen ? "Opened" : "Closed",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                TitleCardWidget(
                  text: "Contact Info",
                  iconData: Icons.mobile_friendly,
                  child: Text(
                    petCenter.contact,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                TitleCardWidget(
                  text: "Service Offered",
                  iconData: Icons.home_repair_service_sharp,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < petCenter.services.length; i++)
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${i + 1} )${petCenter.services.entries.toList()[i].key}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "\$${petCenter.services.entries.toList()[i].value}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),

                TitleCardWidget(
                  text: "Professionals",
                  iconData: Icons.person,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10),
                      for (int i = 0; i < petCenter.professionals.length; i++)
                        Builder(
                          builder: (context) {
                            Professional professional =
                                petCenter.professionals[i];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: [
                                  Text(
                                    "${i + 1}   ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      professional.image,
                                      alignment: Alignment.topCenter,
                                      height: 75,
                                      width: 75,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          professional.name,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          professional.title,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        color: Colors.amber[700],
                        alignment: Alignment.center,
                        child: Text(
                          "Book",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
