import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UploadImagePage extends StatefulWidget {
  const UploadImagePage({super.key});

  @override
  State<UploadImagePage> createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  bool loading = false;
  File? image = null;
  String responseText = "";

  final _picker = ImagePicker();

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
      print("Image picking successful!");
    } else {
      print("Image picking not successful");
    }
  }

  Future uploadImage() async {
    setState(() {
      loading = true;
    });

    var stream = http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image?.length();

    var postUri = Uri.parse("https://api.thecatapi.com/v1/images/upload");
    var request = http.MultipartRequest("POST", postUri);
    request.headers['x-api-key'] = "live_YD6cYybx8FKastDhWRwsmjNaTRdQYRB78yRCBXHEOcOrNUSLMOZ2l1Ifh53JzPKO";
    request.headers['Content-Type'] = 'multipart/form-data';
    //print("Uploaded! file length > $length");
    request.files.add(http.MultipartFile('file', stream, length!));

    try {
      await request.send().then((response) {
        (response.statusCode == 200)? print("Uploaded!"): print("${response
            .reasonPhrase} > ");

        setState(() {
          loading = false;
          responseText = response.reasonPhrase!;
        });
      });
    } catch (e) {
      image = null;
      setState(() {
        loading = false;
        responseText = e.toString();
      });
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    return ModalProgressHUD(
        inAsyncCall: loading,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Color(0xFFFFD1DC),
                leading: IconButton(
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
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
                Container(
                    child: image == null
                        ? Center(child: PlaceholderWidget())
                        : Center(
                            child: Image.file(
                              File(image!.path).absolute,
                              height: 200,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          )),

                Container(
                  padding: const EdgeInsets.only(top: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Text(responseText,
                    style: TextStyle(
                      color: responseText.contains("successfully") ? Colors.green : Colors.red, // Color based on success or failure
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      // Make the text bold
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // _futureAlbum = createAlbum(_controller.text);
                      // _createDataFuture = uploadImage();
                      (image == null) ? getImage() : uploadImage();
                    });
                  },
                  child: Text(image == null ? 'Select Image' : 'Upload Image'),
                ),
              ],
            )));
  }
}

class PlaceholderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[300], // Customize the placeholder color
      ),
      child: const Center(
        child: Icon(
          Icons.photo,
          size: 100, // Customize the size of the icon
          color: Colors.grey, // Customize the color of the icon
        ),
      ),
    );
  }
}

