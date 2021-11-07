import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_eds/core/styles/utils.dart';
import 'package:tdd_eds/core/widgets/error_button.dart';
import 'package:tdd_eds/features/get_albums/presentation/bloc/albums_new_bloc.dart';
import 'package:tdd_eds/features/get_albums/presentation/widgets/albums_preview.dart';
import 'package:tdd_eds/features/get_users/domain/entities/users_info_entity.dart';
import 'package:tdd_eds/features/get_users/presentation/widgets/users_info_item.dart';

import '../../../../injection_container.dart';


class UsersInfoScreen extends StatelessWidget {
  const UsersInfoScreen({Key? key, required this.users}) : super(key: key);


 final UsersEntity users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(users.name),),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<AlbumsNewBloc>())
        ],
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 48,
                      ),
                      const SizedBox(height: 16,),
                      Text('Hello ${users.name}', style: MyTextStyles.header2,)
                    ],
                  ),
                ),
                UserInfoItem(
                  name: users.email,
                  title: 'E-mail',
                ),
                UserInfoItem(
                  name: users.phone,
                  title: 'Phone',
                ),
                UserInfoItem(
                  name: users.website,
                  title: 'Website',
                ),
                UserInfoItem(
                  name: users.company.name,
                  title: 'Company Name',
                ),
                UserInfoItem(
                  name: users.company.bs,
                  title: 'BS ',
                ),
                UserInfoItem(
                  name: users.address.city,
                  title: 'City',
                ),
                UserInfoItem(
                  name: users.address.street,
                  title: 'Street',
                ),
                UserInfoItem(
                  name: users.address.suite,
                  title: 'Suite',
                ),

                const SizedBox(height: 24,),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Posts',
                      style: MyTextStyles.header2,
                    )),

              /*  BlocBuilder<PostsBloc, PostsState>(
                  builder: (context, state) {
                    if (state is PostsInitial) {
                      context.watch<PostsBloc>().add(GetPosts(userId: id));
                      return Container();
                    }
                    if (state is PostsLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is PostsLoaded) {
                      return PostsPreView(userName: userName, state: state.posts,);
                    }
                    if (state is PostsError) {
                      Hive.openBox<List>('posts');
                      var lposts = Hive.box<List>('posts').get('post$id') ?? [];

                      return lposts.length > 0
                          ? PostsPreView(userName: userName, state: lposts)
                          : ErrorButton(onTap: () {
                        context
                            .read<PostsBloc>()
                            .add(GetPosts(userId: id));
                      });
                    } else
                      return SizedBox();
                  },
                ),*/

                const SizedBox(
                  height: 8,
                ),

                BlocBuilder<AlbumsNewBloc, AlbumsNewState>(
                  builder: (context, state) {
                    if (state is AlbumsNewInitial) {
                      BlocProvider.of<AlbumsNewBloc>(context).add(GetAlbumsEvent(userId: users.id));
                      return Container();
                    }
                    if (state is AlbumsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is AlbumsLoaded) {
                      return AlbumsPreview(state: state.albumsEntity,);
                    }
                    if (state is AlbumsLoadingError) {
                      return ErrorButton(onTap: () {
                        BlocProvider.of<AlbumsNewBloc>(context).add(GetAlbumsEvent(userId: users.id));
                      });
                /*      var lalbums =
                          Hive.box<List>('albums').get('album$id') ?? [];
                      return lalbums.length > 0
                          ? AlbumsPreview(userName: userName, state: lalbums)
                          : ErrorButton(onTap: () {
                        context
                            .read<AlbumsBloc>()
                            .add(GetAlbums(userId: id));
                      });*/
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

