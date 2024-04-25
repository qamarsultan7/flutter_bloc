part of 'image_picker_bloc.dart';

class ImagePickerState extends Equatable {
  final XFile? file;
  const ImagePickerState({this.file});
  ImagePickerState copyWith({XFile? pickedfile}) {
    return ImagePickerState(file: pickedfile ?? file);
  }

  @override
  List<Object?> get props => [file];
}

