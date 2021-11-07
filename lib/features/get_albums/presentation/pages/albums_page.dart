import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_eds/features/get_albums/presentation/bloc/albums_new_bloc.dart';
import 'package:tdd_eds/injection_container.dart';


class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Albums'),),

      body: BlocProvider(
        create: (_) => sl<AlbumsNewBloc>(),
        child:
        BlocBuilder<AlbumsNewBloc, AlbumsNewState>(
          builder: (context, state) {
            if(state is AlbumsNewInitial) {

              BlocProvider.of<AlbumsNewBloc>(context).add(GetAlbumsEvent(userId: 1));

              return const Center(child: Text('initial state'));
            } else
            if(state is AlbumsLoading){
              return const Center(child:  CircularProgressIndicator(),);
            }else
            if(state is AlbumsLoaded){
              return ListView.builder(
                itemCount: state.albumsEntity.length,
                  itemBuilder: (context, index) {

                return InkWell(
                  onTap: (){

                  },
                  child: ListTile(title:
                      Text(state.albumsEntity[index].title),),
                );
              });
            }else
            if(state is AlbumsLoadingError){
              return Text(state.message);
            }else {
              return Container();
            }

          },
        ),
      ),
    );
  }


}
