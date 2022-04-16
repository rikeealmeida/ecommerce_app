import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/repositories/user/user_repository.dart';

import '../../utils/validators.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({UserRepository userRepository})
      : _userRepository = userRepository,
        super(RegisterState.initial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterEmailChanged) {
      yield* _mapRegisterEmailChangeToState(event.email);
    } else if (event is RegisterFirstNameChanged) {
      yield* _mapRegisterFirstNameChangeToState(event.firstName);
    } else if (event is RegisterLastNameChanged) {
      yield* _mapRegisterLastNameChangeToState(event.lastName);
    } else if (event is RegisterPhoneChanged) {
      yield* _mapRegisterPhoneChangeToState(event.phone);
    } else if (event is RegisterPasswordChanged) {
      yield* _mapRegisterPasswordChangeToState(event.password);
    } else if (event is RegisterWithCredentialsPressed) {
      yield* _mapRegisterWithCredentialsPressedToState(
          event.email, event.password);
    }
  }

  Stream<RegisterState> _mapRegisterEmailChangeToState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<RegisterState> _mapRegisterFirstNameChangeToState(
      String firstName) async* {
    yield state.update(
        isFirstNameValid: Validators.isValidFirstName(firstName));
  }

  Stream<RegisterState> _mapRegisterLastNameChangeToState(
      String lastName) async* {
    yield state.update(isLastNameValid: Validators.isValidLastName(lastName));
  }

  Stream<RegisterState> _mapRegisterPhoneChangeToState(String phone) async* {
    yield state.update(isPhoneValid: Validators.isValidPhone(phone));
  }

  Stream<RegisterState> _mapRegisterPasswordChangeToState(
      String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<RegisterState> _mapRegisterWithCredentialsPressedToState(
    String email,
    String password,
  ) async* {
    yield RegisterState.loading();
    try {
      await _userRepository.signUp(email, password);
      yield RegisterState.success();
    } catch (_) {
      print(_);
      yield RegisterState.failure();
    }
  }
}
