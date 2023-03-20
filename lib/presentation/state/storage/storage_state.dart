// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'storage_cubit.dart';

abstract class StorageState extends Equatable {
  const StorageState();

  @override
  List<Object> get props => [];
}

class StorageInitial extends StorageState {}

class Uploading extends StorageState {}

class Uploaded extends StorageState {
  final String path;
  const Uploaded({
    required this.path,
  });
}

class Uploaded1 extends StorageState {
  final String path;
  const Uploaded1({
    required this.path,
  });
}

class Uploaded2 extends StorageState {
  final String path;
  const Uploaded2({
    required this.path,
  });
}

class Uploaded3 extends StorageState {
  final String path;
  const Uploaded3({
    required this.path,
  });
}

class Uploaded4 extends StorageState {
  final String path;
  const Uploaded4({
    required this.path,
  });
}
