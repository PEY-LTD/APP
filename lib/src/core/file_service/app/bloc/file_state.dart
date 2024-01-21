part of 'file_bloc.dart';

sealed class FileState extends Equatable {
  const FileState();
  
  @override
  List<Object> get props => [];
}

final class FileInitial extends FileState {}

//* GetMediaFiles States
class GetMediaFilesLoaded extends FileState {
  final SystemData<List<StoredMedia>> media;
  const GetMediaFilesLoaded(this.media);
}
class GetMediaFilesLoading extends FileState {}
class GetMediaFilesError extends FileState {
  final Failure failure;
  const GetMediaFilesError(this.failure);
}