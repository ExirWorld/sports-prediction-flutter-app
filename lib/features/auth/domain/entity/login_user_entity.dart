import 'package:equatable/equatable.dart';

class LoginUserEntity extends Equatable {
  final String? token;
  final DateTime? expireTime;

  const LoginUserEntity({this.token, this.expireTime});

  @override
  List<Object?> get props => [token, expireTime];
}
