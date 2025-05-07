class PetCenter {
  final int id;
  final String name;
  final String location;
  final double rating;
  final bool isOpen;
  final Map<String, double> services;
  final List<String> petTypes;
  final String image;
  final String contact;
  final List<Professional> professionals;

  PetCenter({
    required this.id,
    required this.name,
    required this.location,
    required this.rating,
    required this.isOpen,
    required this.services,
    required this.petTypes,
    required this.image,
    required this.contact,
    required this.professionals,
  });

  factory PetCenter.fromJson(Map<String, dynamic> json) {
    return PetCenter(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      rating: json['rating'].toDouble(),
      isOpen: json['isOpen'],
      services: Map<String, double>.from(
        json['services'].map((key, value) => MapEntry(key, value.toDouble())),
      ),
      petTypes: List<String>.from(json['petTypes']),
      image: json['image'],
      contact: json['contact'],
      professionals:
          (json['professionals'] as List)
              .map((e) => Professional.fromJson(e))
              .toList(),
    );
  }
}

class Professional {
  final String name;
  final String title;
  final String image;

  Professional({required this.name, required this.title, required this.image});

  factory Professional.fromJson(Map<String, dynamic> json) {
    return Professional(
      name: json['name'],
      title: json['title'],
      image: json['image'],
    );
  }
}
