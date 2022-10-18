import 'package:bloc_test/bloc_test.dart';
import 'package:caw_studio/features/authentication/presentation/sign_up_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SignUpCubit mockCounterCubit;
  setUp(() {
    mockCounterCubit = SignUpCubit();
  });

  blocTest('check_initial_state',
      build: () => mockCounterCubit, expect: () => []);

  blocTest<SignUpCubit, SignUpState>('check_state_when_data_is_invalid',
      build: () => mockCounterCubit,
      act: (cubit) {
        mockCounterCubit
          ..addNumber("121211")
          ..changeCountryCode("12");
        return cubit.sendOTP();
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [isA<SignUpErrorState>()]);

  blocTest<SignUpCubit, SignUpState>('check_state_when_data_is_valid',
      build: () => mockCounterCubit,
      act: (cubit) {
        mockCounterCubit
          ..addNumber("1212312")
          ..changeCountryCode("12");
        return cubit.sendOTP();
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [isA<SignUpSuccessState>()]);

  blocTest<SignUpCubit, SignUpState>(
      'check_state_when_state_changes_from_error_to_success',
      build: () => mockCounterCubit,
      act: (cubit) {
        mockCounterCubit
          ..addNumber("12112")
          ..changeCountryCode("12")
          ..addNumber("1212312")
          ..changeCountryCode("12");
        return cubit.sendOTP();
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
            isA<SignUpSuccessState>(),
          ]);

  blocTest<SignUpCubit, SignUpState>(
      'check_state_when_state_changes_from_success_to_error',
      build: () => mockCounterCubit,
      act: (cubit) {
        mockCounterCubit
          ..addNumber("1212312")
          ..changeCountryCode("12")
          ..addNumber("12112")
          ..changeCountryCode("12");
        return cubit.sendOTP();
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
            isA<SignUpErrorState>(),
          ]);
}
