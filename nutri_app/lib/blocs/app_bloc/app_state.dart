part of 'app_bloc.dart';

enum AppStatus { initial }

final class AppState {
  String userName;
  AppStatus status;

  AppState({
    required this.status,
    required this.userName,
  });

  factory AppState.initial() {
    return AppState(
      userName: "",
      status: AppStatus.initial,
    );
  }

  AppState copyWith({
    AppStatus? status,
    String? userName,
  }) {
    return AppState(
      userName: userName ?? this.userName,
      status: status ?? this.status,
    );
  }
}
