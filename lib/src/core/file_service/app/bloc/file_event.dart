part of 'file_bloc.dart';

sealed class FileEvent extends Equatable {
  const FileEvent();

  @override
  List<Object> get props => [];
}

//* GetMediaFiles Event
class GetMediaFilesEvent extends FileEvent {
  final RequestType type;
  final int page;
  final int limit;

  const GetMediaFilesEvent({
    this.type = RequestType.common,
    this.page = 0,
    this.limit = 18,
  });
}
