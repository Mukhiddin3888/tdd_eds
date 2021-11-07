import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tdd_eds/features/get_albums/domain/entities/albums_entity.dart';
import 'package:tdd_eds/features/get_albums/domain/entities/posts_entity.dart';
import 'package:tdd_eds/features/get_users/presentation/pages/users_page.dart';
import 'features/get_users/domain/entities/address_entity.dart';
import 'features/get_users/domain/entities/company_entity.dart';
import 'features/get_users/domain/entities/users_info_entity.dart';
import 'injection_container.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Hive..registerAdapter(AddressEntityAdapter());
  Hive..registerAdapter(CompanyEntityAdapter());
  Hive..registerAdapter(UsersEntityAdapter());
  Hive..registerAdapter(PostsEntityAdapter());
  Hive..registerAdapter(AlbumsEntityAdapter());
  await Hive.openBox<List>('posts');
  await Hive.openBox<List>('albums');
  await Hive.openBox<List>('users');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: UsersScreen(),
    );
  }
}

