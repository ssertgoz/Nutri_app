part of 'app_bloc.dart';

sealed class AppEvent {}

final class SetUser extends AppEvent {
  final String userNmae;
  SetUser({required this.userNmae});
}
