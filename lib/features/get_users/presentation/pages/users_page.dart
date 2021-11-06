import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_eds/features/get_users/presentation/bloc/users_bloc.dart';
import 'package:tdd_eds/injection_container.dart';


class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users'),),

      body: BlocProvider(
        create: (_) => sl<UsersBloc>(),
        child:
        BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if(state is UsersInitial) {

              BlocProvider.of<UsersBloc>(context).add(GetUsersEvent());
              //   context.watch<AlbumsNewBloc>().add(GetAlbumsEvent(userId: 1));
              return Container();
            } else
            if(state is UsersLoading){
              return Center(child:  CircularProgressIndicator(),);
            }else
            if(state is UsersLoaded){
              return ListView.builder(
                itemCount: state.usersEntity.length,
                  itemBuilder: (context, index) {
                return ListTile(title:
                    Text('${state.usersEntity[index].userName}'),);
              });
            }else
            if(state is UsersLoadingError){
              return Text('${state.message}');
            }else {
              return Container();
            }

          },
        ),
      ),
    );
  }


}
