import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medic/assets/features/search/screens/search_screen.dart';

import '../models/order.dart';

class ImageSearch extends StatefulWidget {
  static const String routeName = '/image-search';
  const ImageSearch({super.key});

  @override
  State<ImageSearch> createState() => _ImageSearchState();
}

class _ImageSearchState extends State<ImageSearch> {
  bool textScanning = false;
  XFile? imageFile;
  String scannedText = "";
  void getImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          textScanning = true;
          imageFile = pickedImage;
        });
      }
    } catch (e) {
      setState(() {
        textScanning = false;
        imageFile = null;
        scannedText = "Error Occured while Scanning";
      });
    }
  }

  void getText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText + line.text + "\n";
      }
    }

    log(scannedText);
    setState(() {
      textScanning = false;
      scannedText = scannedText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Container(
                child: Image.asset('assets/images/white_logo.png'),
                // height: 50.0,
                width: 170.00,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.grey,
                  child: imageFile != null
                      ? Image.file(File(imageFile!.path))
                      : Container(),
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        getImage();
                      },
                      child: Text("Select Image")),
                  ElevatedButton(
                      onPressed: () {
                        if (imageFile != null) {
                          getText(imageFile!);
                        }
                      },
                      child: Text("Search"))
                ],
              )
            ],
          ),
          !textScanning && scannedText != ""
              ? Expanded(
                  child: Container(
                  child: SearchScreen(
                    searchQuery: 'test',
                    imageSearch: true,
                  ),
                ))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    imageFile == null
                        ? "Please Select an Image"
                        : "Press Search",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                )
        ],
      ),
    );
  }
}
