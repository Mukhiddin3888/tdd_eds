import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tdd_eds/features/get_albums/domain/entities/posts_entity.dart';
import 'package:tdd_eds/features/get_comments_and_photos/presentation/pages/posts_info_screen.dart';


class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key, required this.posts}) : super(key: key);

  final List<PostsEntity> posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts'),),

      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {

            return InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return PostsInfoScreen(post: posts[index],);
                },));
              },
              child: ListTile(title:
              Text(posts[index].title),),
            );
          }),
    );
  }


}
