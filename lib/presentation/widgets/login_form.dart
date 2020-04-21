///lib/presentation/widgets/login_form.dart
import 'package:flutter/material.dart';
import 'package:proxyprovider/domain/entities/user.dart';

class LoginForm extends StatefulWidget {
  final Function(User) onFormSaved;

  const LoginForm({Key key, @required this.onFormSaved}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _autoValidate;

  GlobalKey<FormState> _formKey;

  TextEditingController _usernameTextEditingController;
  TextEditingController _passwordTextEditingController;

  @override
  void initState() {
    super.initState();

    _autoValidate = false;

    _formKey = GlobalKey<FormState>();

    _usernameTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
        children: [
          TextFormField(
              controller: _usernameTextEditingController,
              decoration: InputDecoration(labelText: "Username"),
              validator: (String value) =>
                  _validateFormField(value, "Username")),
          TextFormField(
              controller: _passwordTextEditingController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
              validator: (String value) =>
                  _validateFormField(value, "Password")),
          FlatButton(
            onPressed: _onLoginPressed,
            child: Text("Login"),
          )
        ],
      ),
    );
  }

  _onLoginPressed() {
    setState(() {
      _autoValidate = true;
    });

    if (_formKey.currentState.validate()) {
      widget.onFormSaved(
        User(
          username: _usernameTextEditingController.text,
        ),
      );
    }
  }

  String _validateFormField(String value, String fieldName) {
    if (value.isEmpty) {
      return "$fieldName cannot be empty.";
    }

    return null;
  }
}
