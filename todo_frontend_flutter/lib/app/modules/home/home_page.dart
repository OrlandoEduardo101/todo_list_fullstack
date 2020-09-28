import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_frontend_flutter/app/shared/auth/auth_controller.dart';
import 'package:todo_frontend_flutter/app/shared/auth/service/auth_status_service.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthStatusService();
  }

  @override
  Widget build(BuildContext context) {
    AuthStatusService();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Observer(builder: (_) {
              return Text('${controller.value}');
            }),
            FlatButton(onPressed: () => AuthController().getLogoff(), child: Text('increment'))
          ],
        ),
      ),
    );
  }
}
