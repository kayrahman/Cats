

class Cat {
  final String id;
  final String url;

  Cat({
    required this.id,
    required this.url,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      id: json['id'],
      url: json['url'],
    );
  }
}

class CatInfo {
  final String url;
  final List<CatBreedInfo> breeds;

  CatInfo({
    required this.url,
    required this.breeds,
  });

  factory CatInfo.fromJson(Map<String, dynamic> json) {
    final List<dynamic> breedData = json['breeds'];
    final List<CatBreedInfo> breedInfo =
    breedData.map((breedJson) => CatBreedInfo.fromJson(breedJson)).toList();

    return CatInfo(
      url: json['url'],
      breeds: breedInfo,
    );
  }
}

class CatBreedInfo {
  final String temperament;
  final String origin;
  final String lifeSpan;
  final String wikipediaUrl;
  final String weightImperial;
  final String weightMetric;
  final String countryCodes;
  final String countryCode;

  CatBreedInfo({
    required this.temperament,
    required this.origin,
    required this.lifeSpan,
    required this.wikipediaUrl,
    required this.weightImperial,
    required this.weightMetric,
    required this.countryCodes,
    required this.countryCode,
  });

  factory CatBreedInfo.fromJson(Map<String, dynamic> json) {
    return CatBreedInfo(
      temperament: json['temperament'],
      origin: json['origin'],
      lifeSpan: json['life_span'],
      wikipediaUrl: json['wikipedia_url'],
      weightImperial: json['weight']['imperial'],
      weightMetric: json['weight']['metric'],
      countryCodes: json['country_codes'],
      countryCode: json['country_code'],
    );
  }
}