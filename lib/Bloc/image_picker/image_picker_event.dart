part of 'image_picker_bloc.dart';

abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();
  @override
  List<Object> get props => [];
}

class CameraImagePicker extends ImagePickerEvent {
  
}

class GalleryImagePicker extends ImagePickerEvent {
  
}
