import 'package:flutter/material.dart';
import '../../../../core/file_service/model/stored_media.dart';
import '../../../../core/resources/colors.dart';

class SingleSelectionThumbnailView extends StatelessWidget {
  final StoredMedia media;
  final Animation<double> animation;
  final bool isSelected;
  final void Function(StoredMedia) selection;

  const SingleSelectionThumbnailView({
    super.key,
    required this.media,
    required this.selection,
    required this.isSelected,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.2),
          end: Offset.zero,
        ).animate(animation),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => selection(media),
          child: Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color:
                            isSelected ? Palette.blueHue : Colors.transparent,
                        width: 5.0,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.memory(
                        media.data,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              // Video Icon
              if (media.type.toLowerCase().contains('video'))
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(right: 5, bottom: 5),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
