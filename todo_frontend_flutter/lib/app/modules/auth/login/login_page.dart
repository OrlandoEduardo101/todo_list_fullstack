import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:  Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'email'
            ),
            onChanged: controller.setEmail,
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextField(
            decoration: InputDecoration(
              labelText: 'password'
            ),
            onChanged: controller.setPassword,
          ),
          Padding(padding: EdgeInsets.all(10)),
          FlatButton(onPressed: controller.login, child: Text('Login'), color: Colors.orange,),
          FlatButton(onPressed: () => Modular.link.pushNamed('/register'), child: Text('Registrar'), color: Colors.lightGreenAccent,)
        ],
        ),
      )
    );
  }
}
