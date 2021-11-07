import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_eds/core/styles/utils.dart';
import 'package:tdd_eds/core/widgets/error_button.dart';
import 'package:tdd_eds/features/get_comments_and_photos/presentation/photos_bloc/photos_bloc.dart';

import '../../../../injection_container.dart';



class AlbumsPhotoScreen extends StatelessWidget {
  const AlbumsPhotoScreen({Key? key, required this.title, required this.index}) : super(key: key);

  final String title;
  final int index;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: BlocProvider(
        create: (context) => sl<PhotosBloc>(),
        child: BlocBuilder<PhotosBloc, PhotosState>(
          builder: (context, state) {

            if(state is PhotosInitial){
              BlocProvider.of<PhotosBloc>(context).add(GetPhotos(albumId: index));

              return Container();
            }
            if(state is Loading){
              return const Center(child: CircularProgressIndicator());
            }
            if(state is Loaded){

              return AlbumsPhotoItems(state: state.entity,);

            }
            if(state is LoadingError){

              return  Center(
                child: ErrorButton(onTap: (){
                  BlocProvider.of<PhotosBloc>(context).add(GetPhotos(albumId: index));
                }),
              );
            }
            else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

class AlbumsPhotoItems extends StatelessWidget {
  const AlbumsPhotoItems({
    Key? key,
    required this.state
  }) : super(key: key);

  final state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 24),
          itemCount: state.length,
          itemBuilder: (BuildContext ctx, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                CachedNetworkImage(imageUrl: '${state[index].url}', height: 110,width: 110,),
                Text('${ state[index].title}',style: MyTextStyles.body, maxLines: 2, ),

              ],
            );
          }),
    );
  }
}
