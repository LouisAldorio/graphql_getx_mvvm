import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/data/model/post.dart';
import 'package:graphql_getx_mvvm/data/model/resource.dart';
import 'package:graphql_getx_mvvm/ui/pages/posts/posts_repository.dart';

class PostsViewModel extends GetxController {
  int page = 1;
  int limit = 10;

  PostsViewModel({ required this.page, required this.limit });

  var isLoading = false.obs;

  var result = Resource<List<Post>>(
    data: [],
    error: null,
  ).obs;

  getPosts(int page, int limit) {
    isLoading.value = true;
    PostsRepository().getPosts(page, limit).then((value) {
      isLoading.value = false;
      result.value = value;
    });
  }
  
  @override
  void onInit() {
    getPosts(page, limit);
    super.onInit();
  }
}
