import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_dart/apimodule/api_service.dart';
import 'package:learning_dart/drawer.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;

import 'CatDetailScreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<void> _createDataFuture;
  List<Cat> cats = [];
  bool shadowColor = true;
  File? image = null;
  final _picker = ImagePicker();
  bool loading = false;

  Future getImage()async{
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if(pickedFile != null){
      image = File(pickedFile.path);
      setState(() {
      });
    }else{
      print("Image pciking not successful");
    }
  }

  Future uploadImage()async{
    setState(() {
      loading = true;
    });

    var stream = http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image?.length();

    var postUri = Uri.parse("https://api.thecatapi.com/v1/images/upload");
    var request = new http.MultipartRequest("POST", postUri);
    request.fields['x-api-key'] =
    "live_YD6cYybx8FKastDhWRwsmjNaTRdQYRB78yRCBXHEOcOrNUSLMOZ2l1Ifh53JzPKO";
    request.fields['user'] = 'blah';
    request.files.add(http.MultipartFile(
        'file', stream, length!));
    //contentType: new MediaType('image', 'jpeg')));

    try {
     await request.send().then((response) {
        if (response.statusCode == 200) print("Uploaded!");
      });
    } catch (e) {
      print('Error uploading image: $e');
    }

  }

  @override
  void initState() {
    super.initState();
    _createDataFuture = Future.value();
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

  Future<void> _sendCatImages() async {
    try {
      final List<Cat> fetchedImages = await fetchPhotos();
      setState(() {
        cats = fetchedImages;
      });
    } catch (e) {
      print('send_image_error > $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(inAsyncCall: loading,
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
                    Icons.favorite,
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
              ElevatedButton(
                onPressed: () {
                  // Call the fetchPhotos function when the button is pressed
                  _loadCatImages();
                },
                child: Text('Load Photos', textDirection: TextDirection.ltr),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 16.0),
                    child: const SizedBox(
                      width: 200,
                      child: TextField(
                        //  controller: _controller,
                        decoration: InputDecoration(hintText: 'Enter Title'),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // _futureAlbum = createAlbum(_controller.text);
                       // _createDataFuture = uploadImage();
                        getImage();
                      });
                    },
                    child: const Text('Select Image'),
                  ),
                 /* FutureBuilder<void>(
                    future: _createDataFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While the data is being created, display a loading spinner
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // Handle any errors that occurred during data creation
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // Data creation is complete, display a success message
                        return Text('Data created successfully! :');
                      }
                    },
                  ),*/
                ],
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
              Container(
                child: image == null? Center(child: Text("pick image"),) : Center(
                  child: Image.file(File(image!.path).absolute,
                  height:100,
                  width : 100,
                  fit :BoxFit.cover,),
                ),
              )
            ],
          ),
          drawer: NavDrawer(),
          floatingActionButton: FloatingActionButton(
            onPressed: uploadImage,
            child: Icon(Icons.upload),
          ),
        ));
  }
}
