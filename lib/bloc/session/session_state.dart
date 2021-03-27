part of 'session_bloc.dart';

@immutable
abstract class SessionState {}

class InitialSessionState extends SessionState {}

class SessionExpired extends SessionState {}
