class Service {
  const Service({
    required this.id,
    required this.title,
    required this.imageURL,
    required this.rating,
    required this.amountOfHours,
    required this.description,
  });

  final String id;
  final String title;
  final String imageURL;
  final double rating;
  final int amountOfHours;
  final List<Map<String, String>> description;
}
