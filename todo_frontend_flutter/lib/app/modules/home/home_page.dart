import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_frontend_flutter/app/modules/home/models/todo_model.dart';
import 'package:todo_frontend_flutter/app/shared/auth/auth_controller.dart';
import 'package:todo_frontend_flutter/app/shared/auth/service/auth_status_service.dart';
import 'home_controller.dart';
import 'item/item_widget.dart';

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

    _showDialog() {
      //model ??= TodoModel();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                SizedBox(
                  width: 600,
                  //height: 600,
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Nome da atividade'),
                    onChanged: controller.setName,
                  ),
                ),
                Observer(
                    builder: (_) => Checkbox(
                        value: controller.done, onChanged: controller.setDone))
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    controller.insert();
                    Navigator.pop(context);
                  },
                  child: Text("Salvar"))
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        return SingleChildScrollView(
          child: Column(
            children: [
              /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    scrollPadding: EdgeInsets.all(12),
                    decoration: InputDecoration(labelText: 'Digite um item'),
                    onChanged: controller.setText,
                  ),
                ),
                GestureDetector(
                  child: Icon(Icons.add),
                  //onTap: controller.save,
                )
              ],
            ),*/
              Container(
                  height: 450,
                  child: Observer(builder: (_) {
                    return ListView.builder(
                        itemCount: controller.list.length,
                        itemBuilder: (_, index) {
                          return ItemWidget(
                            index: index,
                          );
                        });
                  }))
            ],
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showDialog();
        },
      ),
    );
  }
}
