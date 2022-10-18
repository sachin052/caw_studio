part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
}

class SignUpInitialState extends SignUpState {
  @override
  List<Object> get props => [];
}
class SignUpLoadingState extends SignUpState {
  @override
  List<Object> get props => [];
}
class SignUpErrorState extends SignUpState {
  final String errorMessage;

  const SignUpErrorState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class SignUpSuccessState extends SignUpState {
  @override
  List<Object> get props => [];
}