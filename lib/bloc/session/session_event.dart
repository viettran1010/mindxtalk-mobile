part of 'session_bloc.dart';

@immutable
abstract class SessionEvent {}

class TokenExpired extends SessionState {}
