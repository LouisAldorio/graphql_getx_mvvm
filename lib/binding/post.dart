import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/ui/pages/posts/posts_view_model.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostsViewModel());
  }
}