part of 'signin_bloc.dart';

sealed class SigninEvent {}

final class CheckIsOkayToSignUp extends SigninEvent {
  final String name;
  final String age;
  final String email;
  final String password;
  CheckIsOkayToSignUp(
      {required this.name,
      required this.age,
      required this.email,
      required this.password});
}

final class ChangeObscureText extends SigninEvent {}
