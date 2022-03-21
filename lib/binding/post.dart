import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/ui/pages/post_detail/post_view_model.dart';
import 'package:graphql_getx_mvvm/ui/pages/create_post/create_post_view_model.dart';
import 'package:graphql_getx_mvvm/ui/pages/posts/posts_view_model.dart';

class PostsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostsViewModel());
  }
}

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostViewModel());   
  }
}

class CreatePostFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePostViewModel());
  }
}