import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Cat>> fetchPhotos({
  int page = 1,
  int perPage = 10,
  String orderBy = 'latest',
}) async {
  //final String apiUrl = 'https://api.unsplash.com/photos';
  final String apiUrl =
      'https://api.thecatapi.com/v1/images/search?format=json&limit=10';
  final response = await http.get(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
      'x-api-key':
          'live_YD6cYybx8FKastDhWRwsmjNaTRdQYRB78yRCBXHEOcOrNUSLMOZ2l1Ifh53JzPKO',
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    final List<Cat> catImages = jsonData.map((data) {
      return Cat.fromJson(data);
    }).toList();
    print('cat_images > ${catImages[0].url}');
    return catImages;
  } else {
    print(
        'API Error: Failed to load cat images. Status code: ${response.statusCode}');
    throw Exception(
        'Failed to load cat images. Status code: ${response.statusCode}');
  }
}

Future<CatInfo> fetchCatDetail() async {
  //final String apiUrl = 'https://api.unsplash.com/photos';
  final String apiUrl = 'https://api.thecatapi.com/v1/images/0XYvRd7oD';
  final response = await http.get(
    Uri.parse(apiUrl),
   /* headers: {
      'Content-Type': 'application/json',
      'x-api-key':
          'live_YD6cYybx8FKastDhWRwsmjNaTRdQYRB78yRCBXHEOcOrNUSLMOZ2l1Ifh53JzPKO',
    },*/
  );

  if (response.statusCode == 200) {
    //final List<dynamic> jsonData = json.decode(response.body);
    final dynamic jsonData = json.decode(response.body);
    final CatInfo catInfo = CatInfo.fromJson(jsonData);
    print('cat_breed_info > ${catInfo.url}');
    return catInfo;
  } else {
    print(
        'API Error: Failed to load cat images. Status code: ${response.statusCode}');
    throw Exception(
        'Failed to load cat images. Status code: ${response.statusCode}');
  }
}

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
