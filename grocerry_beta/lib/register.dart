import 'package:flutter/material.dart';


class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Full Name',
              ),
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Full Name is required';
                }
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nickname',
              ),
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Nickname is required';
                }
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  highlightColor: Colors.black,
                  onPressed: _submit,
                  child: const Text('Register'),
                )
              ],
            )
          ],
        )
        // child: Column(
        //   // Column is also layout widget. It takes a list of children and
        //   // arranges them vertically. By default, it sizes itself to fit its
        //   // children horizontally, and tries to be as tall as its parent.
        //   //
        //   // Invoke "debug painting" (press "p" in the console, choose the
        //   // "Toggle Debug Paint" action from the Flutter Inspector in Android
        //   // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        //   // to see the wireframe for each widget.
        //   //
        //   // Column has various properties to control how it sizes itself and
        //   // how it positions its children. Here we use mainAxisAlignment to
        //   // center the children vertically; the main axis here is the vertical
        //   // axis because Columns are vertical (the cross axis would be
        //   // horizontal).
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Text(
        //       'You have pushed the button this many times:',
        //     ),
        //     Text(
        //       '$_counter',
        //       style: Theme.of(context).textTheme.display1,
        //     ),
        //   ],
        // ),
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  void _submit() {
    _formKey.currentState.validate();
    print('Form submitted');
  }
}
