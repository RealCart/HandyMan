class Favorites {
  Favorites({required this.favoritesList});

  final List<Map<String, dynamic>> favoritesList;

  factory Favorites.fromMap(List<Map<String, dynamic>> map) {
    return Favorites(
        favoritesList: map.map(
      (item) {
        return {
          "id": item["id"],
          "service_id": item["service_id"],
        };
      },
    ).toList());
  }
}
