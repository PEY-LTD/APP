import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pey/src/core/resources/constants.dart';

class ImagePreviewDialog extends StatelessWidget {
  final String imagePath;
  const ImagePreviewDialog({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          h10,

          GestureDetector(
            child: const CircleAvatar(
              radius: 24.0,
              backgroundColor: Colors.white,
              child: Icon(Icons.close),
            ),
            onTap: () => Navigator.pop(context),
          ),

          //* Vertical Spacer
          const SizedBox(height: 10.0),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: (imagePath.startsWith('https://'))
                  ? CachedNetworkImage(
                      imageUrl: (imagePath),
                    )
                  : Image.file(File(imagePath)),
            ),
          ),
        ],
      ),
    );
  }
}
