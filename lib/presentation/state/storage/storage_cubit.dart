// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:thesis1/domain/usecase/storage/get_dl_url.dart';

import '../../../domain/usecase/storage/upload_to_storage.dart';

part 'storage_state.dart';

class StorageCubit extends Cubit<StorageState> {
  StorageCubit(
    this.uploadToStorage,
    this.getDlUrl,
  ) : super(StorageInitial());

  final UploadToStorage uploadToStorage;
  final GetDlUrl getDlUrl;

  void onUploadToStorage({File? file, required String path}) async {
    emit(Uploading());
    await uploadToStorage(file: file, path: path).then((value) {
      emit(Uploaded(path: path));
    });
  }

  void onUploadFile1({File? file, required String path}) async {
    emit(Uploading());
    await uploadToStorage(file: file, path: path).then((value) async {
      emit(Uploaded1(path: await getDlUrl(path: path)));
    });
  }

  void onUploadFile2({File? file, required String path}) async {
    emit(Uploading());
    await uploadToStorage(file: file, path: path).then((value) async {
      emit(Uploaded2(path: await getDlUrl(path: path)));
    });
  }

  void onUploadFile3({File? file, required String path}) async {
    emit(Uploading());
    await uploadToStorage(file: file, path: path).then((value) async {
      emit(Uploaded3(path: await getDlUrl(path: path)));
    });
  }

  void onUploadFile4({File? file, required String path}) async {
    emit(Uploading());
    await uploadToStorage(file: file, path: path).then((value) async {
      emit(Uploaded4(path: await getDlUrl(path: path)));
    });
  }
}
