import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:vlad/claude_service.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState(); 
}

class _HomePageState extends State<HomePage>{

  // variables
  File? _image;
  final picker = ImagePicker();
  String? _description;
  bool _isLoading = false;

  // show popup method

  Future<bool> _showConfirmationPopup(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: const Text('Is this image good?'),
          content: const Text('Do you want to proceed with this image? It will use some tokens!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
          ],
        );
      }
    );
  }

  // pick image method

  Future<void> _pickImage (ImageSource source) async {
    //pick image from gallery or camera
    try{
      final pickedFile = await picker.pickImage(
        source: source,
        maxHeight: 1080,
        maxWidth: 1920,
        imageQuality: 85, 
      );
      // image has been picked, start analysis
      if(pickedFile != null){
        setState(() {
          _image = File(pickedFile.path);
        });
        bool imageIsConfirmed = await _showConfirmationPopup(context);
        if(imageIsConfirmed){
          await _analyzeImage();
        }
        else {
          throw Exception("Image not confirmed");
        }
      }
    }
    catch(e){
      print(e);
    }
  }

  // analyze image method

  Future<void> _analyzeImage() async {
    if (_image == null) return;

    //loading...
    setState(() {
      _isLoading = true;
    });

    //start image analysis

    try{
      final description = await ClaudeService().analyzeImage(_image!);
      setState(() {
        _description = description;
        _isLoading = false;
      });
    }
    catch(e){
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  // build method

  @override
  Widget build(BuildContext context){
    // scaffold
    return Scaffold(
      // app bar
      appBar: AppBar(
        title: const Text('AI IMAGE-TO-TEXT APP'),
      ),
      // body
      body: Column(
        children: [
          //display image
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFF1E1E1E),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: _image != null ? Image.file(_image!) : const Center(child:Text("Choose image")),
          ),

          const SizedBox(height: 25),
          //buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // button to take photo
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.camera),
                child: const Icon(Icons.camera_alt),
              ),

              //button to pick image from gallery
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: const Icon(Icons.photo_library),
              ),
            ],
          ),

          const SizedBox(height: 25),

          //description loading...
          if(_isLoading) const Center(child:CircularProgressIndicator())

          //description loaded!
          else if (_description != null) Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(_description!),
          ),

        ],
      )
    );
  }
}