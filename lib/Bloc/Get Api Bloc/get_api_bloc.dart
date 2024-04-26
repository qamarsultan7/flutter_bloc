import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_blo/Models/post_model.dart';
import 'package:flutter_blo/Repository/post_api_repository.dart';
import 'package:flutter_blo/Utils/enums.dart';

part 'get_api_event.dart';
part 'get_api_state.dart';

class GetApiBloc extends Bloc<GetApiEvent, GetApiState> {
  PostApiRepository postApiRepository = PostApiRepository();
  GetApiBloc() : super(const GetApiState()) {
    on<FetchPostsEvent>(_fetchApi);
  }

  void _fetchApi(FetchPostsEvent event, Emitter<GetApiState> emit) async {
    await postApiRepository.fetchPost().then((value) {
      log(value.first.id.toString());
      emit(state.coPyWith(
          postList: value, message: 'Success', postStatus: PostStatus.success));
    }).onError((error, stackTrace) {
      log(stackTrace.toString());
      emit(state.coPyWith(message: 'Failed', postStatus: PostStatus.failed));
    });
  }
}
