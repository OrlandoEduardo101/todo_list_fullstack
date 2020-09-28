import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key key, this.title = "Register"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
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
              labelText: 'name'
            ),
            onChanged: controller.setName,
          ),
          Padding(padding: EdgeInsets.all(10)),
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
          FlatButton(onPressed: controller.register, child: Text('Registrar'), color: Colors.lightGreenAccent,)
        ],
        ),
      )
    );
  }
}

