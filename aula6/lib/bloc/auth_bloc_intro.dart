import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBlocIntro extends Bloc<AuthEvent, AuthState> {
  AuthBlocIntro() : super(Unauthenticated()) {
    on<LoginUser>((event, emit) {
      if (event.password == "senha") {
        emit(Authenticated(username: event.username));
      }
        else {
          emit(Unauthenticated());
        }
      }
    );
    on<Logout>((event, emit) => emit(Unauthenticated()));
  }
}

abstract class AuthEvent {
  String? username;
  String? password;
}

class LoginUser extends AuthEvent {
  LoginUser({
    String? username,
    String? password,
  }) : super();
}

class RegisterUser extends AuthEvent {
  RegisterUser({
    String? username,
    String? password,
  }) : super();
}

class Logout extends AuthEvent {}

abstract class AuthState {}

class Authenticated extends AuthState {
  String? username;

  Authenticated({String? username});
}

class Unauthenticated extends AuthState {}

class AuthError extends AuthState {
  String? message;

  AuthError({String? message});
}
