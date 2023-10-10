import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learning_dart/apimodule/api_service.dart';

void main() {
  //MaterialApp(home: MyHomePage());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        // Your app's theme configuration
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
  List<CatImage> catImages = [];

  @override
  void initState() {
    super.initState();
   // _loadCatImages();
  }

  Future<void> _loadCatImages() async {
    try {
      final List<CatImage> fetchedImages = await fetchPhotos();
      setState(() {
        catImages = fetchedImages;
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Unsplash Image Viewer', textDirection: TextDirection.ltr),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Call the fetchPhotos function when the button is pressed
              _loadCatImages();
            },
            child:  Text('Load Photos', textDirection: TextDirection.ltr),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1

              ),
              itemCount: catImages.length,
              itemBuilder: (context, index) {
                final photo = catImages[index];
                return GestureDetector(
                  onTap: () {
                    // Handle tap on the photo if needed
                  },
                  child: Card(
                    child: Column(
                      children: [
                        //Image.network('https://googleflutter.com/sample_image.jpg'),
                        CachedNetworkImage(
                          imageUrl: photo.url,
                          height: 200, // Set the desired height
                          width: 200,  // Set the desired width
                          fit: BoxFit.cover, // Adjust the fit as needed
                          placeholder: (context, url) => CircularProgressIndicator(), // Placeholder widget
                          errorWidget: (context, url, error) {
                            print("Error loading image: $error"); // Print the error message
                            return Icon(Icons.error); // Error widget
                          }, // Error widget
                        ),
                        Text(photo.id, textDirection: TextDirection.ltr),
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



