import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/data/model/comment.dart';
import 'package:graphql_getx_mvvm/data/model/resource.dart';
import 'package:graphql_getx_mvvm/repository/comment.dart';

class CommentsViewModel extends GetxController {

  // find injected viewModel
  static CommentsViewModel get to => Get.find();

  // non Observable variable
  final int limit = 5;

  // observable variable
  var page = 1.obs;
  var isLoading = false.obs;
  var result = Resource<List<Comment>>(
    data: [],
    metadata: null,
    error: null,
  ).obs;

  void getComments(int page, int limit) {
    isLoading.value = true;
    CommentsRepository().getComments(page, limit).then((value) {
      isLoading.value = false;
      result.value.metadata = value.metadata;
      result.value.error = value.error;
      result.value.data?.addAll(value.data!.map((e) => e));
    });
  }

  @override
  void onInit() {
    getComments(page.value, limit);
    super.onInit();
  }

  void loadNextPage() {
    page += 1;
    getComments(page.value,limit);
  }
}
