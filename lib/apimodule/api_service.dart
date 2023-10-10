import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<CatImage>> fetchPhotos({
  int page = 1,
  int perPage = 10,
  String orderBy = 'latest',
}) async {
  //final String apiUrl = 'https://api.unsplash.com/photos';
  final String apiUrl = 'https://api.thecatapi.com/v1/images/search?format=json&limit=10';
  final response = await http.get(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
      'x-api-key': 'YOUR_OWN_API_KEY',
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    final List<CatImage> catImages = jsonData.map((data) {
      return CatImage.fromJson(data);
    }).toList();
    print('cat_images > ${catImages[0].url}');
    return catImages;
  } else {
    print('API Error: Failed to load cat images. Status code: ${response
        .statusCode}');
    throw Exception(
        'Failed to load cat images. Status code: ${response.statusCode}');
  }
}




class UnsplashPhoto {
final String id;
final String description;
final String imageUrl;
final String author;

UnsplashPhoto({
required this.id,
required this.description,
required this.imageUrl,
required this.author,
});
}


class CatImage {
final String id;
final String url;

CatImage({
required this.id,
required this.url,
});

factory CatImage.fromJson(Map<String, dynamic> json) {
return CatImage(
id: json['id'],
url: json['url'],
);
}
}
