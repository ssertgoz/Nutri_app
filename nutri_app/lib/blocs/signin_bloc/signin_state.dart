part of 'signin_bloc.dart';

enum SignInStatus { initial, okayToNext }

final class SignInState {
  SignInStatus status;
  bool obscureText;
  bool isPasswordIncludesOneCapital;
  bool isPasswordIncludesOneNumberl;
  bool isPasswordIncludesOneLoverCase;
  bool isPasswordEightCharacter;

  SignInState({
    required this.status,
    required this.obscureText,
    required this.isPasswordIncludesOneCapital,
    required this.isPasswordIncludesOneNumberl,
    required this.isPasswordIncludesOneLoverCase,
    required this.isPasswordEightCharacter,
  });

  factory SignInState.initial() {
    return SignInState(
        status: SignInStatus.initial,
        obscureText: false,
        isPasswordIncludesOneCapital: false,
        isPasswordIncludesOneNumberl: false,
        isPasswordIncludesOneLoverCase: false,
        isPasswordEightCharacter: false);
  }

  SignInState copyWith(
      {SignInStatus? status,
      bool? obscureText,
      bool? isPasswordIncludesOneCapital,
      bool? isPasswordIncludesOneNumberl,
      bool? isPasswordIncludesOneLoverCase,
      bool? isPasswordEightCharacter}) {
    return SignInState(
        status: status ?? this.status,
        obscureText: obscureText ?? this.obscureText,
        isPasswordIncludesOneCapital:
            isPasswordIncludesOneCapital ?? this.isPasswordIncludesOneCapital,
        isPasswordIncludesOneNumberl:
            isPasswordIncludesOneNumberl ?? this.isPasswordIncludesOneNumberl,
        isPasswordIncludesOneLoverCase: isPasswordIncludesOneLoverCase ??
            this.isPasswordIncludesOneLoverCase,
        isPasswordEightCharacter:
            isPasswordEightCharacter ?? this.isPasswordEightCharacter);
  }
}
