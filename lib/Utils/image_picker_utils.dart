import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> cameraCapture() async {
    XFile? file=await _imagePicker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> galleryCapture() async {
    XFile? file=await _imagePicker.pickImage(source: ImageSource.gallery);
    return file;
  }
}
