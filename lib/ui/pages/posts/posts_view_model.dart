import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/data/model/post.dart';
import 'package:graphql_getx_mvvm/data/model/resource.dart';
import 'package:graphql_getx_mvvm/ui/pages/posts/posts_repository.dart';

class PostsViewModel extends GetxController {

  // find the viewModel in memory
  static PostsViewModel get to => Get.find();

  // non Observable variable
  final int limit = 5;

  // observable variable
  var page = 1.obs;
  var isLoading = false.obs;
  var result = Resource<List<Post>>(
    data: [],
    metadata: null,
    error: null,
  ).obs;

  void getPosts(int page, int limit) {
    isLoading.value = true;
    PostsRepository().getPosts(page, limit).then((value) {
      isLoading.value = false;
      result.value.metadata = value.metadata;
      result.value.error = value.error;
      result.value.data?.addAll(value.data!.map((e) => e));
    });
  }

  @override
  void onInit() {
    getPosts(page.value,limit);
    super.onInit();
  }

  void loadNextPage() {
    page += 1;
    getPosts(page.value,limit);
  }
}
