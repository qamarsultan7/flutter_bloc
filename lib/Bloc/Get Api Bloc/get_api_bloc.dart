import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_blo/Models/post_model.dart';
import 'package:flutter_blo/Utils/enums.dart';

part 'get_api_event.dart';
part 'get_api_state.dart';

class GetApiBloc extends Bloc<GetApiEvent, GetApiState> {
  GetApiBloc() : super(const GetApiState()) {
    on<GetApiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
