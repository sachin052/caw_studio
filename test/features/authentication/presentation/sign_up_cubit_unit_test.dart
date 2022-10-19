import 'package:caw_studio/core/validators/fieldvalidators.dart';
import 'package:caw_studio/features/authentication/presentation/sign_up_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  late SignUpCubit signUpCubit;
  setUpAll(() {
    signUpCubit = SignUpCubit();
  });
  group("checking_sign_up_cubit_validations", () {
    test('check_If_entered_wrong_phone_number', () {
      expectLater(signUpCubit.phoneNumber,
          emitsInOrder([emitsError('please provide a valid phone number')]));
      signUpCubit.addNumber("23");
    });

    test('check_If_entered_correct_number', () {
      expectLater(
          signUpCubit.phoneNumber,
          emitsInOrder([
            emitsError('please provide a valid phone number'),
            emits('2323447')
          ]));
      signUpCubit.addNumber("2323447");
    });

    test('check_If_no_value_emitted', () {
      expectLater(signUpCubit.countryCode, emitsInOrder([emits('')]));
      signUpCubit.changeCountryCode("");
    });

    test('check_If_added_data_Is_valid', () {
      expectLater(signUpCubit.isValidData, emits(true));
      signUpCubit.addNumber("123123213");
      signUpCubit.changeCountryCode("+91");
    });

    // test('check_If_added_data_Is_invalid', () {
    //   expectLater(signUpCubit.isValidData, emits(isA<SignUpErrorState>()));
    //   signUpCubit.addNumber("1213");
    //   signUpCubit.changeCountryCode("+91");
    // });
  });
}
