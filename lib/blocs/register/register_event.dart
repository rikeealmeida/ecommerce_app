part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterEmailChanged extends RegisterEvent {
  final String email;

  const RegisterEmailChanged({this.email});

  @override
  List<Object> get props => [email];
}

class RegisterFirstNameChanged extends RegisterEvent {
  final String firstName;

  const RegisterFirstNameChanged({this.firstName});

  @override
  List<Object> get props => [firstName];
}

class RegisterLastNameChanged extends RegisterEvent {
  final String lastName;

  const RegisterLastNameChanged({this.lastName});

  @override
  List<Object> get props => [lastName];
}

class RegisterPhoneChanged extends RegisterEvent {
  final String phone;

  const RegisterPhoneChanged({this.phone});

  @override
  List<Object> get props => [phone];
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;

  const RegisterPasswordChanged({this.password});

  @override
  List<Object> get props => [password];
}

class RegisterWithCredentialsPressed extends RegisterEvent {
  final String email;
  final String password;
  const RegisterWithCredentialsPressed({this.email, this.password});

  @override
  List<Object> get props => [email, password, ];

}
