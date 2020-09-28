import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_frontend_flutter/app/modules/home/home_controller.dart';
import 'package:todo_frontend_flutter/app/modules/home/models/todo_model.dart';

class ItemWidget extends StatelessWidget {
  final int index;

  const ItemWidget({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Modular.get();

    _showDialog2({TodoModel model}) {
      model ??= TodoModel();
      showDialog(
        context: context,
        builder: (context) {
          controller.setTodo(model);
          TextEditingController controllerTodo = TextEditingController();
          controllerTodo.text = controller.todo.name;
          return AlertDialog(
            title: Observer(
                builder: (_) => SizedBox(
                      width: 600,
                      //height: 600,
                      child: TextField(
                        decoration:
                            InputDecoration(labelText: 'Nome da atividade'),
                        controller: controllerTodo,
                        onChanged: controller.setNameTodo,
                      ),
                    )),
            content: Row(
              children: [
                Text('id: ${model.id}'),
                Observer(builder: (_) {
                  return Checkbox(
                      value: controller.todo.done,
                      onChanged: (value) {
                        controller.setDoneTodo(value);
                        controller.setTodo(controller.todo);
                      });
                })
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    // model.name = controllerTodo.text;
                    controller.update(controller.todo);
                    Navigator.pop(context);
                  },
                  child: Text("Fechar"))
            ],
          );
        },
      );
    }

    return Observer(
        builder: (_) => ListTile(
              title: Text(controller.list[index].name, style: TextStyle(
                decoration: controller.list[index].done ? TextDecoration.lineThrough : TextDecoration.none
              ),),
              trailing: IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                onPressed: () {
                  controller.delete(controller.list[index]);
                },
              ),
              onTap: () => _showDialog2(model: controller.list[index]),
            ));
  }
}
