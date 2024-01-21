import 'package:pey/src/core/errors/exception.dart';
import 'package:pey/src/core/file_service/model/stored_media.dart';
import 'package:pey/src/core/helpers/helpers.dart';
import 'package:pey/src/core/service_helpers/meta.dart';
import 'package:pey/src/core/service_helpers/system_data.dart';
import 'package:photo_manager/photo_manager.dart';
import 'app/bloc/file_bloc.dart';

class FileService {
  Future<SystemData<List<StoredMedia>>> fetchNewMedia(
      GetMediaFilesEvent event) async {
    List<StoredMedia> assets = [];

    final result = await PhotoManager.requestPermissionExtend();

    try {
      await PhotoManager.clearFileCache();

      if (result == PermissionState.authorized) {
        // Media filter options
        final FilterOptionGroup filterOption = FilterOptionGroup(
          imageOption: const FilterOption(),
          videoOption: const FilterOption(
            durationConstraint: DurationConstraint(
              min: Duration(seconds: 1),
              max: Duration(seconds: 30),
              allowNullable: false,
            ),
          ),
          orders: [
            const OrderOption(
              type: OrderOptionType.createDate,
              asc: false,
            ),
          ],
        );

        final mediaCount = await PhotoManager.getAssetCount(
          type: event.type,
          filterOption: filterOption,
        );

        final media = await PhotoManager.getAssetListPaged(
          page: event.page,
          pageCount: event.limit,
          type: event.type,
          filterOption: filterOption,
        );

        for (final asset in media) {
          // pp('${(await asset.file)?.path}');
          final path = ('${(await asset.file)?.path}');

          if (path != 'null') {
            final mediaData = await asset.thumbnailDataWithSize(
              const ThumbnailSize.square(120),
              quality: 100,
            );
            assets.add(
              StoredMedia(
                mediaData!,
                asset.type.name,
                (await asset.file)!.path,
              ),
            );
          }
        }
        return SystemData<List<StoredMedia>>(
          data: assets,
          message: 'Files listed!',
          meta: Meta(
            page: event.page,
            totalData: mediaCount,
            totalPages: (mediaCount / event.limit).ceil(),
            limit: event.limit,
          ),
        );
      } else {
        throw ServerException('Media storage permissions not granted');
      }
    } catch (e) {
      pp(e);
      throw ServerException(e.toString());
    }
  }
}
