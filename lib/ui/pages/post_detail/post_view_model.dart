import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/data/model/post.dart';
import 'package:graphql_getx_mvvm/data/model/resource.dart';
import 'package:graphql_getx_mvvm/ui/pages/post_detail/post_repository.dart';

class PostViewModel extends GetxController {

  static PostViewModel get to => Get.find();

  var isLoading = false.obs;

  var result = Resource<Post>(
    data: null,
    metadata: null,
    error: null,
  ).obs;

  void getPost(String id) {
    isLoading.value = true;
    PostRepository().getPost(id).then((value) {
      isLoading.value = false;
      result.value.metadata = value.metadata;
      result.value.error = value.error;
      result.value.data = value.data;
    });
  }
}
