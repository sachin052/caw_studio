import 'dart:async';

final validatePhoneNumber =
StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {

  if (value.isNotEmpty&&value.length > 6) {
    sink.add(value);
  }
  else {
    sink.addError('please provide a valid phone number');
  }
});

final notNullValidator = StreamTransformer<String?, String>.fromHandlers(handleData: (value, sink) {
  if (value!=null||value?.isNotEmpty==true) {
    sink.add(value!);
  }
  else {
    sink.addError('please provide a valid country code');
  }
});