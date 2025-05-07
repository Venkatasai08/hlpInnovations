import 'package:flutter/material.dart';
import 'package:hlpinnovations/common/common.dart';
import 'package:hlpinnovations/data/data.dart';
import 'package:hlpinnovations/models/model.dart';
import 'package:hlpinnovations/screens/service_list_screen.dart';
import 'package:hlpinnovations/utils/utils.dart';
import 'package:hlpinnovations/widgets/widgets.dart';

final ValueNotifier<String> searchNotifier = ValueNotifier("");

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<PetCenter> petCenters;
  // late List<String> randomImageForCorousel;
  late List<String> servicesByAllPetCenters;

  final List<Color> randomColors = [
    Colors.pink, // Pink
    Colors.green, // Green
    Colors.blue, // Blue
    Colors.amber, // Amber
    Colors.purple, // Purple
    Colors.orange, // Deep Orange
    Colors.lightBlue, // Light Blue
    Colors.cyan, // Cyan
    Colors.indigoAccent, // Lime
    Colors.brown, // Brown
  ];

  @override
  void initState() {
    List<PetCenter> samplePetcenters =
        PetCenterData().petCentersList
            .map((e) => PetCenter.fromJson(e))
            .toList();

    petCenters = samplePetcenters;
    final Set<String> allServices = {};

    for (var center in petCenters) {
      allServices.addAll(center.services.keys);
    }
    servicesByAllPetCenters = allServices.toList();

    // randomImageForCorousel = samplePetcenters.map((e) => e.image).toList();
    // randomImageForCorousel.shuffle();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            toolbarHeight: 100,
            backgroundColor: Colors.blue,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(0),
              background: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/petBg.jpg",
                      fit: BoxFit.cover,
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
                      child: SizedBox(),
                    ),
                  ),
                ],
              ),
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Petzy Care", style: TextStyle(color: Colors.white)),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppTextField(
                            labelText: "Search",
                            onChanged: (val) {
                              searchNotifier.value = val;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 200,
          //     child: PageView.builder(
          //       itemCount: randomImageForCorousel.length ~/ 2,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Image.asset(
          //           randomImageForCorousel[index],
          //           fit: BoxFit.contain,
          //         );
          //       },
          //     ),
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Text(
              "Pet Services",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: ValueListenableBuilder(
                      valueListenable: searchNotifier,
                      builder: (context, val, ch) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: servicesByAllPetCenters.length,
                          itemBuilder: (BuildContext context, int index) {
                            final service = servicesByAllPetCenters[index];
                            if (!service.toLowerCase().contains(
                              val.toLowerCase(),
                            )) {
                              return SizedBox();
                            }
                            final color = randomColors[index % 10];
                            return CategoryCard(
                              service: service,
                              bgColor: color,
                              onTap: () {
                                List<PetCenter> petCenterByCategory =
                                    petCenters
                                        .where(
                                          (e) =>
                                              e.services.keys.contains(service),
                                        )
                                        .toList();
                                Utils().navigateWithAnimation(
                                  context: context,
                                  nextPage: ServiceListScreen(
                                    service: service,
                                    petCenterByCategory: petCenterByCategory,
                                    color: color,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SliverToBoxAdapter(
          //   child: ListView.builder(
          //     itemCount: petCenters.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return;
          //     },
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Text(
              "Pet Centers",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                PetCenter petCenter = petCenters[index];
                return PetCenterCard(petCenter: petCenter);
              },

              childCount: petCenters.length, // Number of items in the list
            ),
          ),
        ],
      ),
    );
  }
}
