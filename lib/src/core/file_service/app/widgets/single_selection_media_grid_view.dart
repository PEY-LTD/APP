import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pey/src/core/dependencies/live_options.dart';
import 'package:pey/src/core/helpers/helpers.dart';
import 'package:pey/src/core/widgets/app_loading_view.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../../core/file_service/model/stored_media.dart';
import '../../../service_helpers/meta.dart';
import '../bloc/file_bloc.dart';
import 'single_selection_thumbnail_view.dart';

class SingleSelectionMediaGrid extends StatefulWidget {
  final RequestType type;

  const SingleSelectionMediaGrid({super.key, required this.type});

  @override
  State<SingleSelectionMediaGrid> createState() =>
      _SingleSelectionMediaGridState();
}

class _SingleSelectionMediaGridState extends State<SingleSelectionMediaGrid> {
  List<StoredMedia> mediaData = [];
  final fileBloc = FileBloc();
  StoredMedia? selected;
  bool loading = false;
  Meta? meta;

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
          handleScrollEvent(scroll);
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
                    icon: Icon(selected == null ? Icons.close : Icons.check),
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

                        return SingleSelectionThumbnailView(
                          media: media,
                          animation: animation,
                          isSelected: selected == media,
                          selection: (p0) {
                            setState(() {
                              selected = media;
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

      pp(state.failure.message);
    }
  }

  void handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
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
