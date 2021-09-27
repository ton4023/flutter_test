import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_hy/cubit/user_cubit.dart';
import 'package:flutter_test_hy/repository/user_repository.dart';

class DetailPage extends StatefulWidget {
  final String id;

  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _userRepository = UserRepository();
  final editText = false;
  final _fistnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _genderController = TextEditingController();
  final _registerController = TextEditingController();
  final _usernameController = TextEditingController();
  // final _passwordController = TextEditingController();
  // final _birthController = TextEditingController();
  // final _courseController = TextEditingController();
  // final _nationalityController = TextEditingController();
  // final _avatarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(userRepository: _userRepository)
        ..selectUser(this.widget.id),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserSelected) {
            _fistnameController.text = state.user.firstname;
            _lastnameController.text = state.user.lastname;
            _emailController.text = state.user.email;
            _mobileController.text = state.user.mobile;
            _genderController.text = state.user.gender;
            _registerController.text = state.user.createdAt;
            _usernameController.text = state.user.username;
            //  _passwordController.text = state.user.password;
            // _birthController.text = state.user.birth;
            // _courseController.text = state.user.course;
            // _nationalityController.text = state.user.nationality;
            // _avatarController.text = state.user.firstname;

            return Scaffold(
              appBar: AppBar(title: Text('User Information'),actions: [Icon(Icons.edit,size: 30,)],),
              body: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Form(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(state.user.avatar),
                                  fit: BoxFit.cover)),
                        ),
                        _usernameField(),
                        _fistnameField(),
                        _lastnameField(),
                        _genderField(),
                        _emailField(),
                        _mobileField(),
                        _registerField()
                      ],
                    )),
                  ),
                ),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _fistnameField() {
    return TextFormField(
      controller: _fistnameController,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Fistname'
      ),
    );
  }

  Widget _lastnameField() {
    return TextFormField(
      controller: _lastnameController,
      enabled: editText ,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Lastname'
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      controller: _usernameController,
      enabled: editText ,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Username'
      ),
    );
  }

  Widget _genderField() {
    return TextFormField(
      controller: _genderController,
      enabled: editText ,
      decoration: InputDecoration(
        icon: Icon(Icons.personal_injury),
        labelText: 'Gender'
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      controller: _emailController,
      enabled: editText ,
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        labelText: 'Email'
      ),
    );
  }

  Widget _mobileField() {
    return TextFormField(
      controller: _mobileController,
      enabled: editText ,
      decoration: InputDecoration(
        icon: Icon(Icons.phone),
        labelText: 'Moblie'
      ),
    );
  }

  Widget _registerField() {
    return TextFormField(
      controller: _registerController,
      enabled: editText ,
      decoration: InputDecoration(
        icon: Icon(Icons.timelapse),
        labelText: 'Registered Date'
      ),
    );
  }
}
