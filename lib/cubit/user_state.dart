part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}


class UserLoaded extends UserState {
  final List<User> users;

  UserLoaded({required this.users});
  @override
  List<Object> get props => [users];
}

class UserSelected extends UserState {
  final User user;
  UserSelected({required this.user});
  @override
  List<Object> get props => [user];
}
