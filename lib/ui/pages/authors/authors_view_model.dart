import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/data/model/author.dart';
import 'package:graphql_getx_mvvm/data/model/resource.dart';
import 'package:graphql_getx_mvvm/ui/pages/authors/authors_repository.dart';

class AuthorsViewModel extends GetxController {

  // find injected viewModel
  static AuthorsViewModel get to => Get.find();

  // non Observable variable
  final int limit = 10;

  // observable variable
  var page = 1.obs;
  var isLoading = false.obs;
  var result = Resource<List<Author>>(
    data: [],
    metadata: null,
    error: null,
  ).obs;

  void getAuthors(int page, int limit) {
    isLoading.value = true;
    AuthorsRepository().getAuthors(page, limit).then((value) {
      isLoading.value = false;
      result.value.metadata = value.metadata;
      result.value.error = value.error;
      result.value.data?.addAll(value.data!.map((e) => e));
    });
  }

  @override
  void onInit() {
    getAuthors(page.value, limit);
    super.onInit();
  }

  void loadNextPage() {
    page += 1;
    getAuthors(page.value,limit);
  }
}
