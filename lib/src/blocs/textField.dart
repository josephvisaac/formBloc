import 'dart:async';
import './validators.dart';

//The stream controller IS the stream as well!!! Boom, it all makes sense now
class TextFieldBloc extends Validators {
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePasword => _password.sink.add;
  dispose() {
    _email.close();
    _password.close();
  }
}

final textFieldBloc = TextFieldBloc();
