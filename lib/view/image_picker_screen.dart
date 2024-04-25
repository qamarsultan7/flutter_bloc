import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blo/Bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pick Image'),
        elevation: 5,
      ),
      body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  width: double.infinity,
                  color: Colors.grey,
                  child: state.file == null
                      ? const Icon(Icons.camera)
                      : Image.file(File(state.file!.path.toString())),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<ImagePickerBloc>().add(CameraImagePicker());
                },
                child: Container(
                  color: Colors.amber,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  width: double.infinity * .2,
                  height: 70,
                  child: const FittedBox(child: Text('Capture Image')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<ImagePickerBloc>().add(GalleryImagePicker());
                },
                child: Container(
                  color: Colors.amber,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  width: double.infinity * .2,
                  height: 70,
                  child: const FittedBox(child: Text('Choose From Gallery')),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
