import 'package:api_handling_bloc/data/model/post_model.dart';
import 'package:api_handling_bloc/data/repository/post_repository.dart';
import 'package:api_handling_bloc/domain/cubits/post_cubit/post_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    getPost();
  }

  PostRepository postRepository = PostRepository();

  void getPost() async {
    try {
      List<PostModel> posts = await postRepository.getPost();
      emit(PostLoadedState(posts));
    } catch (e) {
      emit(PostErrorState(e.toString()));
    }
  }
}
