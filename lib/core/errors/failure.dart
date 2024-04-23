import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class GeneralFailure extends Failure {
  final String msg;

  GeneralFailure(this.msg);
}
