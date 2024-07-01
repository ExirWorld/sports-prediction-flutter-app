import 'package:equatable/equatable.dart';

class SuccessEntity extends Equatable {
  final String? msg;
  final String? code;

  const SuccessEntity({this.msg, this.code});

  @override
  List<Object?> get props => [msg, code];
}
