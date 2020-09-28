import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'item_controller.g.dart';

@Injectable()
class ItemController = _ItemControllerBase with _$ItemController;

abstract class _ItemControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
