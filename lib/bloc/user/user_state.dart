part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool isUser;
  final User? user;

  const UserState({this.isUser = false, this.user});
}

class UserInitialState extends UserState {
  const UserInitialState() : super(isUser: false, user: null);
}

class UserSetState extends UserState {
  final User newUser;
  const UserSetState(this.newUser) : super(isUser: true, user: newUser);
}
