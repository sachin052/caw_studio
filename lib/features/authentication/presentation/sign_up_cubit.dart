import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caw_studio/core/validators/fieldvalidators.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  // phone number
  final _phoneController = BehaviorSubject<String>();

  Stream<String> get phoneNumber =>
      _phoneController.stream.transform(validatePhoneNumber);

  Function(String) get addNumber => _phoneController.sink.add;

  // country code
  final _countryCodeController = BehaviorSubject<String?>();

  Stream<String> get countryCode =>
      _countryCodeController.stream.transform(notNullValidator);

  Function(String) get changeCountryCode => _countryCodeController.sink.add;

  // validating both phone with country code
  Stream<bool> get isValidData => Rx.combineLatest2(countryCode, phoneNumber, (a, b) => true);

  SignUpCubit() : super(SignUpInitialState());

  sendOTP() async {
    try {
      var bool = await isValidData.any((element) => true);
      if (bool) {
        emit(SignUpSuccessState());
      } else {
        emit(const SignUpErrorState(errorMessage: "Invalid phone number"));
      }
    } catch (e) {
      emit(const SignUpErrorState(errorMessage: "Invalid phone number"));
    }
  }
}
