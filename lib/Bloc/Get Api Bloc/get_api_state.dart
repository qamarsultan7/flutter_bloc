part of 'get_api_bloc.dart';

class GetApiState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;
  const GetApiState(
      {this.postStatus = PostStatus.loading,
      this.postList = const <PostModel>[],
      this.message = ''});
  GetApiState coPyWith(
      {PostStatus? postStatus, List<PostModel>? postList, String? message}) {
    return GetApiState(
        postList: postList ?? this.postList,
        postStatus: postStatus ?? this.postStatus,
        message: message ?? this.message);
  }

  @override
  List<Object> get props => [postList, postStatus, message];
}

