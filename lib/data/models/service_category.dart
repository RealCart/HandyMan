class ServiceCategory {
  ServiceCategory({required this.serviceCategoryList});

  final List<Map<String, dynamic>> serviceCategoryList;

  factory ServiceCategory.fromMap(List<dynamic> map) {
    return ServiceCategory(
      serviceCategoryList: map.map(
        (item) {
          final mapItem = item as Map<String, dynamic>;
          return {"id": mapItem["id"], "name": mapItem["name"]};
        },
      ).toList(),
    );
  }
}
