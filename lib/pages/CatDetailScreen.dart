import 'package:flutter/material.dart';

import '../model/data_model.dart';

class CatDetailScreen extends StatefulWidget {
  final Cat cat;

  CatDetailScreen(this.cat);

  @override
  _CatDetailScreenState createState() => _CatDetailScreenState();
}

class _CatDetailScreenState extends State<CatDetailScreen> {
  CatInfo? catInfo;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loading = true;
   // _loadCatImages();
  }

 /* Future<void> _loadCatImages() async {
    try {
      final CatInfo info = await fetchCatDetail(widget.cat.id);
      setState(() {
        catInfo = info;
        loading = false;
      });
    } catch (e) {
      // Handle error
      print('cat_breed_info_error > $e');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Details'),
      ),
      body: Center(
        child: loading
            ? CircularProgressIndicator() // Show a loading indicator while loading
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Image.network(catInfo?.url ?? "")),
                  SizedBox(height: 20),
                  Text(
                    'Cat Temperament: ${catInfo?.breeds[0].temperament}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Cat Origin: ${catInfo?.breeds[0].origin}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Cat Life Span: ${catInfo?.breeds[0].lifeSpan}',
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () {
                      // Perform network calls and state updates here if needed
                    },
                    child: Text('Learn More'),
                  ),
                ],
              ),
      ),
    );
  }
}
