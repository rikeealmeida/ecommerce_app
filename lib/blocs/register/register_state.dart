part of 'register_bloc.dart';

class RegisterState {
  final bool isEmailValid;
  final bool isFirstNameValid;
  final bool isLastNameValid;
  final bool isPhoneValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isEmailValid && isPasswordValid && isFirstNameValid && isLastNameValid && isPhoneValid;

  RegisterState({
    this.isFirstNameValid,
    this.isLastNameValid,
    this.isPhoneValid,
    this.isEmailValid,
    this.isPasswordValid,
    this.isSubmitting,
    this.isSuccess,
    this.isFailure,
  });

  factory RegisterState.initial() {
    return RegisterState(
      isEmailValid: true,
      isFirstNameValid: true,
      isLastNameValid: true,
      isPasswordValid: true,
      isPhoneValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }
  factory RegisterState.loading() {
    return RegisterState(
      isEmailValid: true,
      isFirstNameValid: true,
      isLastNameValid: true,
      isPhoneValid: true,
      isPasswordValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: true,
    );
  }
  factory RegisterState.failure() {
    return RegisterState(
      isEmailValid: true,
      isFirstNameValid: true,
      isLastNameValid: true,
      isPhoneValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }
  factory RegisterState.success() {
    return RegisterState(
      isEmailValid: true,
      isFirstNameValid: true,
      isLastNameValid: true,
      isPhoneValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  RegisterState update({
    bool isEmailValid,
    bool isPasswordValid,
    bool isFirstNameValid,
    bool isLastNameValid,
    bool isPhoneValid,
  }) {
    return copyWith(
        isEmailValid: isEmailValid,
        isPasswordValid: isPasswordValid,
        isFirstNameValid: isFirstNameValid,
        isLastNameValid: isLastNameValid,
        isPhoneValid: isPhoneValid,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false);
  }

  RegisterState copyWith({
    bool isEmailValid,
    bool isFirstNameValid,
    bool isLastNameValid,
    bool isPhoneValid,
    bool isPasswordValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return RegisterState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isFirstNameValid: isFirstNameValid ?? this.isFirstNameValid,
      isLastNameValid: isLastNameValid ?? this.isLastNameValid,
      isPhoneValid: isPhoneValid ?? this.isPhoneValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}
