import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:learning_dart/apimodule/api_service.dart';
import 'package:learning_dart/drawer.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../model/data_model.dart';
import 'CatDetailScreen.dart';
import 'UploadImagePage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<void> _createDataFuture;
  List<Cat> cats = [];
  bool shadowColor = true;
  bool loading = false;

  List<String> catBreeds = [
    'Abyssinian',
    'Siamese',
    'Maine Coon',
    'Persian',
    'Bengal',
  ];

  @override
  void initState() {
    super.initState();
    _createDataFuture = Future.value();
    // _loadCatImages();
  }

  /*Future<void> _loadCatImages() async {
    try {
      final List<Cat> fetchedImages = await fetchPhotos();
      setState(() {
        cats = fetchedImages;
      });
    } catch (e) {
      // Handle error
    }
  }*/

  /*Future<void> _sendCatImages() async {
    try {
      final List<Cat> fetchedImages = await fetchPhotos();
      setState(() {
        cats = fetchedImages;
      });
    } catch (e) {
      print('send_image_error > $e');
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    List<String> catBreeds = [
      'Abyssinian',
      'Siamese',
      'Maine Coon',
      'Persian',
      'Bengal'
    ];

    List<Widget> catBreedChips = catBreeds.map((breed) {
      return Container(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
          onTap: () {
            // Handle the chip tap action here
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              border: Border.all(
                color: Colors.purple.shade700, // Customize border color
                width: 1.0, // Customize border width
              ),
              borderRadius:
                  BorderRadius.circular(16.0), // Customize chip border radius
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            // Customize chip padding
            child: Text(
              breed,
              style: TextStyle(
                color: Colors.white, // Customize text color
              ),
            ),
          ),
        ),
      );
    }).toList();

    return ModalProgressHUD(
        inAsyncCall: loading,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Color(0xFFFFD1DC),
              leading: IconButton(
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                icon: const Icon(Icons.menu),
                color: Colors.purple,
                onPressed: () {},
              ),
              title: Text(
                "Cats",
                style: TextStyle(
                  color: Colors.purple,
                  // Set text color to white
                ),
              ),
              actions: [
                IconButton(
                  tooltip: 'Demo tooltip',
                  icon: const Icon(
                    Icons.filter_1_outlined,
                    color: Colors.purple,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  tooltip: 'Demo tooltip',
                  icon: const Icon(
                    Icons.search,
                    color: Colors.purple,
                  ),
                  onPressed: () {},
                ),
              ]),
          body: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: Wrap(children: catBreedChips)),
              ElevatedButton(
                onPressed: () {
                  // Call the fetchPhotos function when the button is pressed
                  //_loadCatImages();
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
                      child: Column(children: [
                        SizedBox(
                          // height: height,
                          child: Card(
                            // This ensures that the Card's children (including the ink splash) are clipped correctly.
                            clipBehavior: Clip.antiAlias,
                            // shape: shape,
                            child: InkWell(
                              onTap: () {},
                              // Generally, material cards use onSurface with 12% opacity for the pressed state.
                              splashColor: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.12),
                              // Generally, material cards do not have a highlight overlay.
                              highlightColor: Colors.transparent,
                              child: Semantics(
                                  label: cat.id,
                                  child: Card(
                                    child: Column(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: cat.url,
                                          height: 200,
                                          width: 200,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) {
                                            print(
                                                "Error loading image: $error"); // Print the error message
                                            return Icon(
                                                Icons.error); // Error widget
                                          }, // Error widget
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        )
                      ]),
                    );
                  },
                ),
              ),
            ],
          ),
          drawer: NavDrawer(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Navigate to the second screen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UploadImagePage()),
              );
            },
            child: Icon(Icons.upload),
          ),
        ));
  }
}
