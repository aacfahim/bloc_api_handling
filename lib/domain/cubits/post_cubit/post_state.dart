import 'package:api_handling_bloc/data/model/post_model.dart';

abstract class PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<PostModel> posts;
  PostLoadedState(this.posts);
}

class PostErrorState extends PostState {
  final String errorMessage;
  PostErrorState(this.errorMessage);
}
