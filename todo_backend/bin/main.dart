import 'package:todo_backend/todo_backend.dart';

Future main() async {
  
  final app = Application<TodoBackendChannel>()
      ..options.configurationFilePath = "config.yaml"
      ..options.port = 8888;

  final count = Platform.numberOfProcessors ~/ 2;
  await app.start(numberOfInstances: count > 0 ? count : 1);

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}


/*
##########  Commands  ############
docker exec postgres postgres -upostgres -p postgress
docker container list
docker exec -it 79c0a568f3cc bash
# psql -U postgres
docker stop 79c0a568f3cc
aqueduct db generate
aqueduct db upgrade --connect tododb2://postgres:postgres@localhost:5432/tododb2
aqueduct serve
*/