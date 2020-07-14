import 'package:blocTextField/src/blocs/textField.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return MaterialApp(
        home: Scaffold(
      body: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                username(),
                password(),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget username() {
    return StreamBuilder(
      stream: textFieldBloc.email,
      builder: (ctx, snapshot) {
        return TextFormField(
          onChanged: textFieldBloc.changeEmail,
          decoration: InputDecoration(
            hintText: 'josephvisaac@gmail.com',
            labelText: 'Email Address',
            errorText: snapshot.error,
          ),
          onSaved: (String val) {
            print(' saved $val');
          },
        );
      },
    );
  }

  Widget password() {
    return StreamBuilder(
      stream: textFieldBloc.password,
      builder: (ctx, snapshot) {
        return TextFormField(
          decoration: InputDecoration(
            hintText: '',
            labelText: 'password',
            errorText: snapshot.error,
          ),
          onSaved: (String val) {
            print(' saved $val');
          },
        );
      },
    );
  }
}
