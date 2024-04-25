import 'package:flutter/material.dart';
import 'package:flutter_blo/Bloc/Counter%20Bloc/counter_bloc.dart';
import 'package:flutter_blo/Bloc/Favourite%20items%20bloc/favourite_itms_bloc_bloc.dart';
import 'package:flutter_blo/Bloc/Todo%20bloc/todoblock_bloc.dart';
import 'package:flutter_blo/Bloc/example%202/switch_bloc.dart';
import 'package:flutter_blo/Bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter_blo/Repository/fav_items_repository.dart';
import 'package:flutter_blo/Utils/image_picker_utils.dart';
import 'package:flutter_blo/view/fav_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => TodoblockBloc()),
        BlocProvider(
            create: (context) => FavouriteItmsBlocBloc(FavItemsRepository())),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.dark,
          // colorScheme: ColorScheme.fromSeed(
          //     seedColor: const Color.fromARGB(255, 118, 148, 201)),
          useMaterial3: true,
        ),
        home: const FavItems(),
      ),
    );
  }
}
