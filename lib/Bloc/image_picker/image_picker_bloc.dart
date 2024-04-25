// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_blo/Utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraImagePicker>(_cameraCapture);
    on<GalleryImagePicker>(_galleryPicker);
  }

  void _cameraCapture(
      CameraImagePicker event, Emitter<ImagePickerState> states) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(pickedfile: file));
  }

  void _galleryPicker(
      GalleryImagePicker event, Emitter<ImagePickerState> states) async {
    XFile? file = await imagePickerUtils.galleryCapture();
    emit(state.copyWith(pickedfile: file));
  }
}
