import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_hy/models/users.dart';
import 'package:flutter_test_hy/repository/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;

  UserCubit({required this.userRepository}) : super(UserInitial());

  void getUser() async {
    try {
      final users = await userRepository.getData();
      emit(UserLoaded(users: users));
    } catch (e) {
      print(e);
    }
  }

  void selectUser(String id) async {
    final user = await userRepository.selectData(id);
    emit(UserSelected(user: user));
  }

  void createUser(
      firstname,
      lastname,
      username,
      password,
      email,
      gender,
      mobile,
      birth,
      nationality,
      course,
      ) async {
    User u = User(
        id: '',
        firstname: firstname,
        lastname: lastname,
        username: username,
        password: password,
        email: email,
        gender: gender,
        mobile: mobile,
        birth: birth,
        nationality: nationality,
        course: course,
        avatar: course,
        createdAt: '');
    var data = u.toJson();
    await userRepository.createData(data);
    this.getUser();
  }
}
