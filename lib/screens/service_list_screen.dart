import 'package:flutter/material.dart';
import 'package:hlpinnovations/models/model.dart';
import 'package:hlpinnovations/widgets/widgets.dart';

class ServiceListScreen extends StatelessWidget {
  final String service;
  final Color color;
  final List<PetCenter> petCenterByCategory;
  const ServiceListScreen({
    super.key,
    required this.service,
    required this.petCenterByCategory,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(service, style: TextStyle(color: Colors.white)),
            backgroundColor: color,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                PetCenter petCenter = petCenterByCategory[index];
                return ServiceCard(petCenter: petCenter);
              },

              childCount:
                  petCenterByCategory.length, // Number of items in the list
            ),
          ),
        ],
      ),
    );
  }
}
