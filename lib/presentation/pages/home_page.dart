///lib/presentation/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxyprovider/application/services/cart_service.dart';

class HomePage extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (BuildContext context) => HomePage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Provider.of<CartService>(context).user.username,
            ),
            Text(
              Provider.of<CartService>(context).cartGreeting,
            ),
          ],
        ),
      ),
    );
  }
}
