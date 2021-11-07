import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_eds/core/styles/utils.dart';
import 'package:tdd_eds/core/widgets/error_button.dart';
import 'package:tdd_eds/features/get_comments_and_photos/presentation/comments_bloc/comments_bloc.dart';
import 'package:tdd_eds/injection_container.dart';


class PostsInfoScreen extends StatelessWidget {
  const PostsInfoScreen({Key? key, required this.post,}) : super(key: key);

  final  post;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text(post.title),),
      body: BlocProvider(
        create: (context) => sl<CommentsBloc>(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: ListTile(
                  minVerticalPadding: 8,
                  //leading: CircleAvatar(),
                  title: Text(post.title),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(post.body),
                  ),
                ),
              ),
              const SizedBox(height: 24,),
              BlocBuilder<CommentsBloc, CommentsState>(
                builder: (context, state) {
                  if(state is CommentsInitial){
                    BlocProvider.of<CommentsBloc>(context).add(GetCommentsEvents(postId: post.id));

                  }
                  if(state is Loading){
                    return const Center(child: CircularProgressIndicator());
                  }
                  if(state is Loaded){
                    return Column(
                      children: [
                        CommentsListItem(state: state.entity,),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                            alignment: Alignment.center,
                            height: 48,
                            decoration: BoxDecoration(
                                color: MyColors.blue,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Text('Post comments',style: MyTextStyles.header3.copyWith(color: MyColors.white),)),
                      ],
                    );

                  }
                  if(state is LoadingError){
                   // var lcomments =  Hive.box<List>('comments').get('comment${post.id}')?? []  ;
                    return/* lcomments.length > 0 ?

                    Column(
                      children: [
                        CommentsListItem(state: lcomments,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                            alignment: Alignment.center,
                            height: 48,
                            decoration: BoxDecoration(
                                color: MyColors.blue,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Text('Please be Online to Post Comments',style: MyTextStyles.header3.copyWith(color: MyColors.white),)),
                      ],
                    )

                     : */ErrorButton(onTap: (){
                      BlocProvider.of<CommentsBloc>(context).add(GetCommentsEvents(postId: post.id));
                       },);
                  }
                  else return SizedBox();
                },
              ),

            ],),
        ),
      ),
    );
  }
}

class CommentsListItem extends StatelessWidget {
  const CommentsListItem({
    Key? key,
    required this.state,
  }) : super(key: key);

  final  state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.length,
      itemBuilder: (context, index) {
        return ListTile(
          isThreeLine: true,
          minVerticalPadding: 8,
          leading: const CircleAvatar(),
          title: Text('${state[index].name}'),
          subtitle: Padding(
            padding: const EdgeInsets.all(8),
            child: Text('${state[index].body}',),
          ),


        );
      },);
  }
}


