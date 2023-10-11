import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_dart/apimodule/api_service.dart';

void main() {
  //MaterialApp(home: MyHomePage());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BJIT Academy',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Cat> cats = [];
  bool shadowColor = true;

  @override
  void initState() {
    super.initState();
    // _loadCatImages();
  }

  Future<void> _loadCatImages() async {
    try {
      final List<Cat> fetchedImages = await fetchPhotos();
      setState(() {
        cats = fetchedImages;
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );

    return Scaffold(
      appBar: AppBar(
          title: Text('Cats', textDirection: TextDirection.ltr),
          shadowColor:
              shadowColor ? Theme.of(context).colorScheme.shadow : null,
          actions: <Widget>[
            TextButton(
              style: style,
              onPressed: () {},
              child: const Text('Action 1'),
            ),
            TextButton(
              style: style,
              onPressed: () {},
              child: const Text('Action 2'),
            ),
          ]),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Call the fetchPhotos function when the button is pressed
              _loadCatImages();
            },
            child: Text('Load Photos', textDirection: TextDirection.ltr),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1),
              itemCount: cats.length,
              itemBuilder: (context, index) {
                final cat = cats[index];
                return GestureDetector(
                  onTap: () {
                    // Handle tap on the photo if needed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CatDetailScreen(cat)),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        //Image.network('https://googleflutter.com/sample_image.jpg'),
                        CachedNetworkImage(
                          imageUrl: cat.url,
                          height: 200,
                          // Set the desired height
                          width: 200,
                          // Set the desired width
                          fit: BoxFit.cover,
                          // Adjust the fit as needed
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          // Placeholder widget
                          errorWidget: (context, url, error) {
                            print(
                                "Error loading image: $error"); // Print the error message
                            return Icon(Icons.error); // Error widget
                          }, // Error widget
                        ),
                        Text(cat.id, textDirection: TextDirection.ltr),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
    _loadCatImages();
  }

  Future<void> _loadCatImages() async {
    try {
      final CatInfo info = await fetchCatDetail();
      setState(() {
        catInfo = info;
        loading = false;
      });
    } catch (e) {
      // Handle error
      print('cat_breed_info_error > $e');
    }
  }

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
                  Expanded(
                    child: Image.network(catInfo?.url ?? "")
                  ),
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
