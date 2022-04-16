part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStarted extends AuthEvent {}

class AuthLoggedIn extends AuthEvent {}

class AuthLoggedOut extends AuthEvent {}

class AuthUserChanged extends AuthEvent {
  final User user;

  const AuthUserChanged({this.user});

  @override
  List<Object> get props => [user];
}
