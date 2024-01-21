import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pey/src/core/dependencies/pey_icons_icons.dart';
import '../resources/colors.dart';

class MediaSourceSelectionView extends StatelessWidget {
  final void Function(ImageSource source) onSelection;

  const MediaSourceSelectionView({
    Key? key,
    required this.onSelection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      height: 400.0,
      child: Material(
        type: MaterialType.transparency,
        borderRadius: BorderRadius.circular(12.0),
        clipBehavior: Clip.antiAlias,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 52.0,
                          backgroundColor:
                              Theme.of(context).primaryColor.withOpacity(0.7),
                          child: Icon(
                            FontAwesomeIcons.camera,
                            color: Palette.blueHue,
                            size: 32,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          'Camera',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    onTap: () => onSelection(ImageSource.camera),
                  ),
                  InkWell(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              Theme.of(context).primaryColor.withOpacity(0.6),
                          radius: 52.0,
                          child: const Icon(
                            PeyIcons.arrow_back,
                            color: Palette.blueHue,
                            size: 32,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          'Gallery',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    onTap: () => onSelection(ImageSource.gallery),
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: IconButton.outlined(
                  style: IconButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white, width: 2.0),
                  ),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
