import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tdd_eds/core/styles/utils.dart';
import 'package:tdd_eds/features/get_albums/presentation/pages/posts_list_page.dart';
import 'package:tdd_eds/features/get_comments_and_photos/presentation/pages/posts_info_screen.dart';

class PostsPreView extends StatelessWidget {
  const PostsPreView({
    Key? key,
    required this.state,
  }) : super(key: key);

  final state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: (state.length <= 3) &&
              (state.length > 0)
              ? state.length
              : 3,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                onTap: (){
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => PostsInfoScreen(post: state[index],),));
                },
                title: Text(
                  '${state[index].title}',
                  style: MyTextStyles.header3,
                ),
                subtitle: Text(
                  '${state[index].body}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),
            );
          },
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => PostsScreen(
                         posts: state,

                        ),
                      ));
                },
                child: Text(
                  'See all posts',
                  style: MyTextStyles.header2
                      .copyWith(color: Colors.blue),
                ))),
      ],
    );
  }
}
