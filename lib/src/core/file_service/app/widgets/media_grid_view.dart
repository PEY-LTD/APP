import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pey/src/core/dependencies/live_options.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../../core/file_service/model/stored_media.dart';
import '../../../helpers/helpers.dart';
import '../../../service_helpers/meta.dart';
import '../../../widgets/app_loading_view.dart';
import '../bloc/file_bloc.dart';
import 'media_thumbnail_view.dart';

class MediaGrid extends StatefulWidget {
  final RequestType type;
  const MediaGrid({super.key, required this.type});

  @override
  State<MediaGrid> createState() => _MediaGridState();
}

class _MediaGridState extends State<MediaGrid> {
  final fileBloc = FileBloc();
  bool loading = false;
  Meta? meta;
  List<StoredMedia> mediaData = [];
  List<StoredMedia> selected = [];

  @override
  void initState() {
    super.initState();

    fileBloc.add(GetMediaFilesEvent(type: widget.type));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FileBloc, FileState>(
      bloc: fileBloc,
      listener: fileListener,
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scroll) {
          handleScrollEvent(
            scroll,
          );
          return true;
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Upload Media'),
                  IconButton(
                    splashRadius: 26,
                    onPressed: () => Navigator.pop(context, selected),
                    icon: Icon(selected.isEmpty ? Icons.close : Icons.check),
                  ),
                ],
              ),
            ),
            Expanded(
              child: mediaData.isEmpty
                  ? loading
                      ? const LoadingView(size: 20)
                      : const Center(
                          child: Text('No media loaded'),
                        )
                  : LiveGrid.options(
                      options: options,
                      itemCount: mediaData.length,
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder:
                          (BuildContext context, int index, animation) {
                        final media = mediaData[index];

                        return MediaThumbnailView(
                          media: media,
                          animation: animation,
                          isSelected: selected.contains(media),
                          selection: (p0) {
                            setState(() {
                              if (!selected.contains(p0)) {
                                selected.add(p0);
                              } else {
                                selected.remove(p0);
                              }
                            });
                          },
                        );
                      },
                    ),
            ),
            if (loading && mediaData.isNotEmpty)
              const SizedBox(
                height: 1,
                width: 60,
                child: LinearProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }

  void fileListener(context, state) {
    pp(state.runtimeType);

    if (state is GetMediaFilesLoaded) {
      setState(() {
        if (mediaData.isEmpty) {
          mediaData = state.media.data;
        } else if (state.media.meta!.page! > meta!.page!) {
          mediaData.addAll(state.media.data);
        }
        meta = state.media.meta;
        loading = false;
      });
    } else if (state is GetMediaFilesLoading) {
      setState(() {
        loading = true;
      });
    } else if (state is GetMediaFilesError) {
      setState(() {
        loading = false;
      });
    }
  }

  void handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33 &&
        !loading) {
      if (meta != null) {
        int page = meta!.page! + 1;
        int total = meta!.totalPages!;

        if (page < total) {
          fileBloc.add(GetMediaFilesEvent(page: page));
        }
      }
    }
  }
}
