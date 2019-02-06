import 'package:flutter/material.dart';
import './pages/product.dart';
import 'package:email_validator/email_validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement 
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  // Initially password is obscure
  bool _obscureText = true;

  String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Login',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                fontSize: 20.0),
          ),
          const SizedBox(
            height: 16.0,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email Id',
            ),
            validator: (value) {
              if (EmailValidator.validate(value)== false) {
                return 'Please enter email id';
              }
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              validator: (value) =>
                  value.length < 6 ? 'Password to short' : null,
              onSaved: (value) => _password = value,
              obscureText: _obscureText),
          new FlatButton(
              onPressed: _toggle,
              child:
                  new Text(_obscureText ? "Show Password" : "Hide Password")),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, we want to show a Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductPage()),
                  );
                }
              },
              child: Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}
