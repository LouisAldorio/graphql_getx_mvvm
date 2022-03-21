import "package:get/get.dart";
import 'package:graphql_getx_mvvm/router/bottom_navigation.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationRouter());
  }
}
