

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tdd_eds/core/styles/utils.dart';
import 'package:tdd_eds/features/get_albums/domain/entities/albums_entity.dart';
import 'package:tdd_eds/features/get_albums/presentation/pages/albums_page.dart';
import 'package:tdd_eds/features/get_comments_and_photos/presentation/pages/photos_screen.dart';




class AlbumsPreview extends StatelessWidget {
  const AlbumsPreview({
    Key? key,
    required this.state,
  }) : super(key: key);

  final List<AlbumsEntity> state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Albums',
              style: MyTextStyles.header2,
            )),
        const SizedBox(
          height: 16,
        ),
        ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
          return  ListTile(
            onTap: (){
                 Navigator.push(context, CupertinoPageRoute(
                    builder: (context) => AlbumsPhotoScreen(
                        title: state[index].title,index: state[index].id,)));
              },
            title: Text(
              state[index+1].title,
              style: MyTextStyles.header3,
              maxLines: 2,
            ) ,
            trailing: const Icon(Icons.keyboard_arrow_right),
          );
        },),

        const SizedBox(
          height: 16,
        ),

        Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) =>
                            AlbumsScreen(
                              state: state,
                            ),
                      ));
                },
                child: Text(
                  'See all Albums',
                  style: MyTextStyles.header2
                      .copyWith(color: MyColors.blue),
                ))),
        const SizedBox(
          height: 24,
        )
      ],
    );
  }
}


