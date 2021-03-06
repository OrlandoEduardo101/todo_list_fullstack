import 'dart:convert';
import 'dart:html' hide Client;

import 'package:angular/angular.dart';
import 'package:angular_app/utils/utils.dart';
import 'package:angular_router/angular_router.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'dashboard',
  templateUrl: 'dashboard.html',
  styleUrls: [
    '../../app_component.css',
  ],
  directives: [coreDirectives, routerDirectives, formDirectives],
)
class Dashboard extends OnInit {
  @ViewChild('modal')
  Element modal;

  int id;
  String name;
  bool done;
  Utils utils;
  Dio client;

  var todos;

  Dashboard(this.utils) {
    client = utils.client;
  }

  @override
  void ngOnInit() {
    getTodos();
  }

  openModal([todo]) {
    this.modal.classes.toggle('is-active');

    if (todo == null) {
      this.done = false;
    } else {
      this.id = todo['id'];
      this.name = todo['name'];
      this.done = todo['done'];
    }
  }

  closeModal() {
    resetModalFields();
    getTodos();
    this.modal.classes.toggle('is-active');
  }

  resetModalFields() {
    id = null;
    name = null;
    done = null;
  }

  toggleSwitch() {
    this.done = !done;
  }

  getTodos() async {
    var response = await client.get("/todo",
        //data: {'name': name, 'done': done},
        options: RequestOptions(headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': window.localStorage['token']
        }));

    todos = response.data;
  }

  handleInsert() async {
    await client.post("/todo",
        data: {'name': name, 'done': done},
        options: RequestOptions(headers: {
          //'Content-type': 'application/json',
          //'Accept': 'application/json',
          'Authorization': window.localStorage['token']
        }));

    closeModal();
  }

  handleUpdate() async {
    await client.put("/todo/${id}",
        data: {'name': name, 'done': done},
        options: RequestOptions(
          headers: {
          //'Content-type': 'application/json',
          //'Accept': 'application/json',
          'Authorization': window.localStorage['token']
        }
      ));

    closeModal();
  }

  handleDelete(todo) async {
    if (window.confirm("Excluir a tarefa '${todo['name']}'?")) {
      await client.delete("/todo/${todo['id']}",
          options: RequestOptions(headers: {'Authorization': window.localStorage['token']}));

      getTodos();
    }
  }
}
