import "package:get/get.dart";
import 'package:graphql_getx_mvvm/controller/main.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}
