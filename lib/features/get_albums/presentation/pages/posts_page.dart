import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tdd_eds/features/get_albums/domain/entities/posts_entity.dart';


class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key, required this.state}) : super(key: key);

  final List<PostsEntity> state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts'),),

      body: ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {

            return InkWell(
              onTap: (){

              },
              child: ListTile(title:
              Text(state[index].title),),
            );
          }),
    );
  }


}
