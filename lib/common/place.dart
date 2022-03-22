class Place {
  final double x, y;
  String place_name,
      category_group_code,
      category_group_name,
      category_name,
      distance,
      id,
      place_url,
      description,
      phone,
      address_name,
      road_address_name;

  Place(
      {required this.x,
      required this.y,
      required this.place_name,
      required this.category_group_code,
      required this.category_group_name,
      required this.category_name,
      required this.distance,
      required this.id,
      required this.place_url,
      required this.description,
      required this.phone,
      required this.address_name,
      required this.road_address_name});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
        x: double.parse(json['x']),
        y: double.parse(json['y']),
        place_name: json['place_name'],
        category_group_code: json['category_group_code'],
        category_group_name: json['category_group_name'],
        category_name: json['category_name'],
        distance: json['distance'],
        id: json['id'],
        place_url: json['place_url'],
        description: json['description'],
        phone: json['phone'],
        address_name: json['address_name'],
        road_address_name: json['road_address_name']);
  }
}
