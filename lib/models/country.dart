class Country {
  final String name;
  final int zone;

  const Country({required this.name, required this.zone});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json["properties"]["name"],
      zone: json["properties"]["zone"],
    );
  }
}
