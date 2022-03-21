import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/ui/pages/authors/authors_view_model.dart';

class AuthorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthorsViewModel());
  }
}