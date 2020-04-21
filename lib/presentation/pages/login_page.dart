///lib/presentation/pages/login_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxyprovider/application/services/user_service.dart';
import 'package:proxyprovider/domain/entities/user.dart';
import 'package:proxyprovider/presentation/pages/home_page.dart';
import 'package:proxyprovider/presentation/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginForm(
              onFormSaved: (User user) => _onFormSaved(context, user),
            ),
          ],
        ),
      ),
    );
  }

  _onFormSaved(BuildContext context, User user) {
    Provider.of<UserService>(context, listen: false).setUser(user);
    Navigator.of(context).pushReplacement(HomePage.route());
  }
}
