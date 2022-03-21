import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/data/model/post.dart';
import 'package:graphql_getx_mvvm/data/model/resource.dart';
import 'package:graphql_getx_mvvm/ui/pages/post_detail/post_repository.dart';

class PostViewModel extends GetxController {

  // arguments passed
  dynamic argumentData = Get.arguments;

  // Dependency Injection
  static PostViewModel get to => Get.find();

  // observable variable
  var isLoading = false.obs;
  var result = Resource<Post>(
    data: null,
    metadata: null,
    error: null,
  ).obs;

  void getPost() {
    isLoading.value = true;
    PostRepository().getPost(argumentData["id"].toString()).then((value) {
      isLoading.value = false;
      result.value.metadata = value.metadata;
      result.value.error = value.error;
      result.value.data = value.data;
    });
  }

  @override
  void onInit() {
    getPost();
    super.onInit();
  }
}
