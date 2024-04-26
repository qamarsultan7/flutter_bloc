import 'package:flutter/material.dart';
import 'package:flutter_blo/Bloc/Get%20Api%20Bloc/get_api_bloc.dart';
import 'package:flutter_blo/Utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetApiBloc>().add(FetchPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: BlocBuilder<GetApiBloc, GetApiState>(builder: (context, state) {
        switch (state.postStatus) {
          case PostStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case PostStatus.failed:
            return Center(child: Text(state.message));
          case PostStatus.success:
            return ListView.builder(
                itemCount: state.postList.length,
                itemBuilder: (context, index) {
                  return Text(index.toString());
                });
          default:
            return const Text('Something Went Wrong');
        }
      }),
    );
  }
}
