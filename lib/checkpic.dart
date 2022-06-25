import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';


class CheckPic extends StatefulWidget {

  String Image1;
  String Image2;
  String Image3;
  String Image4;
  String Image5;
  String Image6;
  int length;

  CheckPic({
    Key? key,
    required this.Image1,
    required this.Image2,
    required this.Image3,
    required this.Image4,
    required this.Image5,
    required this.Image6,
    required this.length
  }) : super(key: key);

  @override
  State<CheckPic> createState() => _CheckPicState();
}

class _CheckPicState extends State<CheckPic> {

  @override
  Widget build(BuildContext context) {

    List<String> image = [
      widget.Image1,
      widget.Image2,
      widget.Image3,
      widget.Image4,
      widget.Image5,
      widget.Image6,
    ];

    return MaterialApp(
      home: Scaffold(
        body: PhotoViewGallery.builder(
          itemCount: widget.length,
          builder: (context, index) {
            final data = image[index];

            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(
                data
              ),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.contained * 4
            );
          } ,
        ),
      ),
    );
  }
}



