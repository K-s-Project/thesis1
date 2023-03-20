// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'persistence_cubit.dart';

abstract class PersistenceState extends Equatable {
  const PersistenceState();

  @override
  List<Object> get props => [];
}

class PersistenceInitial extends PersistenceState {}

class Loaded extends PersistenceState {
  final RecordEntity record;
  const Loaded({
    required this.record,
  });
}

class Loading extends PersistenceState {}

class Saved extends PersistenceState {}

class PersistenceEmpty extends PersistenceState {}
