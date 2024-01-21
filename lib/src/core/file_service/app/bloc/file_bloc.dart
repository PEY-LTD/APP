import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pey/src/core/dependencies/service_runner.dart';
import 'package:pey/src/core/service_helpers/system_data.dart';
import 'package:photo_manager/photo_manager.dart';


import '../../../errors/failure.dart';
import '../../file_service.dart';
import '../../model/stored_media.dart';

part 'file_event.dart';
part 'file_state.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  final service = FileService();

  FileBloc() : super(FileInitial()) {
    on<GetMediaFilesEvent>((event, emit) async {
      emit(GetMediaFilesLoading());

      final result = await ServiceRunner().runService(
        () => service.fetchNewMedia(event),
      );

      emit(result.fold(
        (failure) => GetMediaFilesError(failure),
        (data) => GetMediaFilesLoaded(data),
      ));
    });
  }
}
