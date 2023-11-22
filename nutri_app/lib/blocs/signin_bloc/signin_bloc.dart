import 'package:flutter_bloc/flutter_bloc.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SignInState> {
  SigninBloc() : super(SignInState.initial()) {
    on<CheckIsOkayToSignUp>(_onCheckIsOkayToSignUp);
    on<ChangeObscureText>(_onChangeObscureText);
  }

  _onChangeObscureText(
    ChangeObscureText event,
    Emitter<SignInState> emit,
  ) {
    state.obscureText = !state.obscureText;
    emit(state.copyWith());
  }

  _onCheckIsOkayToSignUp(
    CheckIsOkayToSignUp event,
    Emitter<SignInState> emit,
  ) {
    if (_isOkayToSignUp(event.name, event.age, event.email, event.password)) {
      state.status = SignInStatus.okayToNext;
    } else {
      state.status = SignInStatus.initial;
    }
    _checkPasswordRules(event.password);
    emit(state.copyWith());
  }

  bool _isOkayToSignUp(name, age, email, password) {
    return ((name != "") &&
        age != "" &&
        (email != "") &&
        password != "" &&
        state.isPasswordEightCharacter &&
        state.isPasswordIncludesOneCapital &&
        state.isPasswordIncludesOneLoverCase &&
        state.isPasswordIncludesOneNumberl);
  }

  void _checkPasswordRules(String password) {
    // Büyük harf içerip içermediğini kontrol edin.
    if (password.contains(RegExp(r'[A-Z]'))) {
      state.isPasswordIncludesOneCapital = true;
    } else {
      state.isPasswordIncludesOneCapital = false;
    }

    // Küçük harf içerip içermediğini kontrol edin.
    if (password.contains(RegExp(r'[a-z]'))) {
      state.isPasswordIncludesOneLoverCase = true;
    } else {
      state.isPasswordIncludesOneLoverCase = false;
    }

    // Sayı içerip içermediğini kontrol edin.
    if (password.contains(RegExp(r'[0-9]'))) {
      state.isPasswordIncludesOneNumberl = true;
    } else {
      state.isPasswordIncludesOneNumberl = false;
    }

    // 8 karakter uzunluğunda olup olmadığını kontrol edin.
    if (password.length >= 8) {
      state.isPasswordEightCharacter = true;
    } else {
      state.isPasswordEightCharacter = false;
    }
  }
}
