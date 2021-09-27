import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_hy/cubit/user_cubit.dart';
import 'package:flutter_test_hy/detail_page.dart';
import 'package:flutter_test_hy/models/users.dart';
import 'package:flutter_test_hy/register_page.dart';
import 'package:flutter_test_hy/repository/user_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          UserCubit(userRepository: _userRepository)..getUser(),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            final users = state.users;
            final size = MediaQuery.of(context).size;
            // print(state);
            return Scaffold(
              floatingActionButton: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.purple),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    icon: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white54,
                    )),
              ),
              appBar: AppBar(
                title: Text('User Management'),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search))
                ],
              ),
              body: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) =>
                      cardUser(context, users[index], size)),
            );
          }

          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  cardUser(BuildContext context, User user, Size size) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailPage(
                    id: user.id,
                  ))),
      child: Container(
        height: 100,
        width: size.width * 0.9,
        padding: EdgeInsets.all(16),
        child: Card(
          color: Colors.grey[200],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(user.avatar), fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(user.firstname, style: TextStyle(fontSize: 16)),
                        SizedBox(
                          width: 20,
                        ),
                        Text(user.lastname, style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
