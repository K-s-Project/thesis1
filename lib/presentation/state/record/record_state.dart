// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'record_cubit.dart';

abstract class RecordState extends Equatable {
  const RecordState();

  @override
  List<Object> get props => [];
}

class RecordInitial extends RecordState {}

class RecordLoaded extends RecordState {
  final List<RecordEntity> records;
  const RecordLoaded({
    required this.records,
  });
}

class RecordEmpty extends RecordState {}

class RecordLoading extends RecordState {}

class Done extends RecordState {}
