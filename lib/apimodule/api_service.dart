import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../model/data_model.dart';

class DataServices {
  Future<List<Cat>> fetchPhotos() async {
    //final String apiUrl = 'https://api.unsplash.com/photos';
    final String apiUrl =
        'https://api.thecatapi.com/v1/images/search?has_breeds=1&format=json&limit=10';
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

  Future<CatInfo> fetchCatDetail(String cat_id) async {
    //final String apiUrl = 'https://api.unsplash.com/photos';
    final String apiUrl = 'https://api.thecatapi.com/v1/images/$cat_id';
    print('cat_id > ${cat_id}');
    final response = await http.get(
      Uri.parse(apiUrl),
    );

    if (response.statusCode == 200) {
      final dynamic jsonData = json.decode(response.body);
      //return jsonData.map((e) => CatInfo.fromJson(e));
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
}
