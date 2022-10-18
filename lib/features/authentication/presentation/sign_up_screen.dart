import 'package:caw_studio/features/authentication/presentation/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../generated/assets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpCubit signUpCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signUpCubit = SignUpCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocProvider<SignUpCubit>(
              create: (context) => signUpCubit,
              child: BlocListener<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if(state is SignUpErrorState){
                    Fluttertoast.showToast(
                        msg: state.errorMessage,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                  else if(state is SignUpSuccessState){
                    Fluttertoast.showToast(
                        msg: "Success",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 104,
                    ),
                    Image.asset(
                      Assets.imagesLogo,
                      height: 74,
                      width: 71,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Welcome to \nHealthNest",
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                            color: Color(0xFF545B63)),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                      ),
                      child: Text(
                        "Enter Mobile Number",
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    StreamBuilder<String>(
                      stream: signUpCubit.phoneNumber,
                      builder: (_, snapShot) {
                        print(snapShot.error);
                        return InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber value) {
                            signUpCubit.addNumber(value.phoneNumber ?? "");
                            print(value);
                          },
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          formatInput: false,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),

                          // inputBorder: OutlineInputBorder(),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "We never compromise on security!\nHelp us create a safe place by providing your mobile number to maintain authenticity.",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Color(0xffA5B1C2),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: StreamBuilder<String?>(
                          stream: signUpCubit.phoneNumber,
                          initialData: null,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed:
                                  snapshot.data == null || snapshot.hasError
                                      ? null
                                      : signUpCubit.sendOTP(),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  disabledBackgroundColor:
                                      const Color(0xffe8ebef),
                                  elevation: 1,
                                  minimumSize: const Size(107, 51),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2))
                                  // Background color
                                  ),
                              child: Text(
                                "Send OTP",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: snapshot.data == null ||
                                                snapshot.hasError
                                            ? Color(0xFFA5B1C2)
                                            : Colors.white),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
