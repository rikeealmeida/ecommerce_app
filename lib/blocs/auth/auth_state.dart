part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
 const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  final User user;

  const AuthSuccess(this.user);
  @override
  List<Object> get props => [user];
}

class AuthFailure extends AuthState {}



// enum AuthStatus { unknown, authenticated, unauthenticated }

//  class AuthState extends Equatable {
//   final AuthStatus status;
//   final auth.User user;

//   const AuthState._({this.status = AuthStatus.unknown, this.user});

//   const AuthState.unknown() : this._();

//   const AuthState.authenticated({auth.User user})
//       : this._(status: AuthStatus.authenticated, user: user);

//   const AuthState.unauthenticated()
//       : this._(status: AuthStatus.unauthenticated);

//   @override
//   List<Object> get props => [status, user];
// }
