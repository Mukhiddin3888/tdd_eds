import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tdd_eds/features/get_albums/domain/entities/albums_entity.dart';
import 'package:tdd_eds/features/get_comments_and_photos/presentation/pages/photos_screen.dart';



class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({Key? key,required this.state}) : super(key: key);

  final List<AlbumsEntity> state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Albums'),),

      body: ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {

            return InkWell(
              onTap: (){
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => AlbumsPhotoScreen(
                        title: state[index].title, index: state[index].id),));
              },
              child: ListTile(title:
              Text(state[index].title),),
            );
          })
    );
  }


}
