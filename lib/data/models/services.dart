class Services {
  Services({required this.services});

  final List<Map<String, dynamic>> services;

  factory Services.fromMap(List<dynamic> list) {
    return Services(
      services: list.map((item) {
        final mapItem = item as Map<String, dynamic>;
        return {
          "id": mapItem["id"],
          "name": mapItem["name"],
          "rating": mapItem["rating"],
          "duration": mapItem["duration"],
          "description": mapItem["description"],
          "equipment": mapItem["equipment"],
          "favorites": mapItem["favorites"],
          "service_category_id": mapItem["service_category_id"],
          "service_id": mapItem["service_id"],
        };
      }).toList(),
    );
  }
}
