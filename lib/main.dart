import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_api/cubit/user_cubit.dart';
import 'pages/home_page.dart';
import 'repository/user_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final userRepository = UserRepository();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => (UserCubit(userRepository: userRepository)..getUser()),
        child: HomePage(),
      ),
    );
  }
}
