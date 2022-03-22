class Place{
  final int mapx,mapy;
  String title, category, link, description,telephone,address,roadAddress;
  Place({
    required this.mapx,
    required this.mapy,
    required this.title,
    required this.category,
    required this.link,
    required this.description,
    required this.telephone,
    required this.address,
    required this.roadAddress
  });
  factory Place.fromJson(Map<String, dynamic> json){
    return Place(
      mapx:int.parse(json['mapx']),
      mapy:int.parse(json['mapy']),
      title:json['title'],
      category: json['category'],
      link:json['link'],
      description:json['description'],
      telephone:json['telephone'],
      address:json['address'],
      roadAddress:json['roadAddress']
    );
  }
}
