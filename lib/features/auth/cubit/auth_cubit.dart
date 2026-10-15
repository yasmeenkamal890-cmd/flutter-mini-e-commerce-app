import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthStatus { initial, loading, success, failure }

class AuthState {
  const AuthState({this.status = AuthStatus.initial, this.errorMessage});

  final AuthStatus status;
  final String? errorMessage;
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  Future<void> login({required String email, required String password}) async {
    if (email.trim().isEmpty || !email.contains('@')) {
      emit(const AuthState(
        status: AuthStatus.failure,
        errorMessage: 'Please enter a valid email address.',
      ));
      return;
    }
    if (password.isEmpty) {
      emit(const AuthState(
        status: AuthStatus.failure,
        errorMessage: 'Please enter your password.',
      ));
      return;
    }

    emit(const AuthState(status: AuthStatus.loading));
    // Mock authentication: any valid-looking email and non-empty password work.
    await Future<void>.delayed(const Duration(milliseconds: 350));
    emit(const AuthState(status: AuthStatus.success));
  }

  void reset() => emit(const AuthState());
}
