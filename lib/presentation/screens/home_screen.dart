import 'package:api_handling_bloc/data/model/post_model.dart';
import 'package:api_handling_bloc/domain/cubits/post_cubit/post_cubit.dart';
import 'package:api_handling_bloc/domain/cubits/post_cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Handling using Bloc StateManagement")),
      body: SafeArea(
        child: BlocConsumer<PostCubit, PostState>(
          listener: (context, state) {
            if (state is PostErrorState) {
              SnackBar snackBar = SnackBar(content: Text("No Internet"));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              SnackBar snackBar = SnackBar(
                content: Text("Back online"),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            return BlocBuilder<PostCubit, PostState>(
              builder: (context, state) {
                if (state is PostLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is PostLoadedState) {
                  return buildPostModel(state.posts);
                } else {
                  return Center(child: Text("Error"));
                }
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildPostModel(List<PostModel> posts) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Card(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(posts[index].title.toString()),
          )),
        );
      },
    );
  }
}
