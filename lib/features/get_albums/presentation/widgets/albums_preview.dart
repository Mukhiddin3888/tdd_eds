

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tdd_eds/core/styles/utils.dart';
import 'package:tdd_eds/features/get_albums/domain/entities/albums_entity.dart';
import 'package:tdd_eds/features/get_albums/presentation/pages/albums_page.dart';




class AlbumsPreview extends StatelessWidget {
  const AlbumsPreview({
    Key? key,
//    required this.userName,
    required this.state,
  }) : super(key: key);

  //final String userName;
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
        AlbumsPreviewItem(state: state,
            index: 0,
            onTap: (){
       /*   Navigator.push(context, CupertinoPageRoute(builder: (context) => AlbumsScreen(
              title: state[0].title, index: 1),));*/
        }),
        AlbumsPreviewItem(state: state,
          index: 1,
          onTap: (){
    /*      Navigator.push(context, CupertinoPageRoute(builder: (context) => AlbumsScreen(
              title: state[1].title, index: 2),));*/
        },),
        AlbumsPreviewItem(state: state,
          index: 2,
          onTap: (){
/*          Navigator.push(context, CupertinoPageRoute(builder: (context) => AlbumsScreen(
              title: state[2].title, index: 3),));*/
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

class AlbumsPreviewItem extends StatelessWidget {
  const AlbumsPreviewItem({
    Key? key,
    required this.state,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  final  state;
  final GestureTapCallback onTap;
  final int index;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        '${state[index].title}',
        style: MyTextStyles.header3,
        maxLines: 2,
      ) ,
      trailing: const Icon(Icons.keyboard_arrow_right),
    );
  }
}

