import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/data/model/comment.dart';
import 'package:graphql_getx_mvvm/data/model/resource.dart';
import 'package:graphql_getx_mvvm/ui/pages/comments/comments_repository.dart';

class CommentsViewModel extends GetxController {

  static CommentsViewModel get to => Get.find();

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
    getComments(1,5);
    super.onInit();
  }

  void clear() {
    result = Resource<List<Comment>>(
      data: [],
      metadata: null,
      error: null,
    ).obs;
  }
}
