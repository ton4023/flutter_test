import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_api/pages/register_page.dart';
import '/models/users.dart';
import '/widgets/card.dart';
import '/cubit/user_cubit.dart';
import '/repository/user_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userRepository = UserRepository();
  late List<User> filteredUsers;
  bool _isSearching = false;
  final _searchQueryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade600,
        title: _isSearching ? _buildSearchField() : Text('User Information'),
        actions: [_buildActions()],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage()));
        },
        label: const Text('Register'),
        icon: const Icon(Icons.person_add),
        backgroundColor: Colors.purple.shade500,
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            filteredUsers = state.users;
            List<User> _users = state.users;
            return ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) =>
                    CardWidget(state: _users[index]));
          }
          if (state is UserFiltered) {
            return ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) =>
                    CardWidget(state: filteredUsers[index]));
          }
          return Container();
        },
      ),
    );
  }

  _buildSearchField() {
    return TextField(
        controller: _searchQueryController,
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Search Username...",
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.white30),
        ),
        style: TextStyle(color: Colors.white, fontSize: 16.0),
        onChanged: (query) {
          setState(() {
            filteredUsers = filteredUsers
                .where((item) => (
                    item.username.toLowerCase().contains(query.toLowerCase())))
                .toList();
            context.read<UserCubit>().filterUser(filteredUsers);
          });
        });
  }

  _buildActions() {
    if (_isSearching) {
      return IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          setState(() {
            _searchQueryController.text = '';
            _isSearching = !_isSearching;
            context.read<UserCubit>().getUser();
          });
        },
      );
    }

    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        setState(() {
          _isSearching = !_isSearching;
        });
      },
    );
  }
}
