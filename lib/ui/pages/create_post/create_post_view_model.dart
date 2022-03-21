import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/data/model/author.dart';
import 'package:graphql_getx_mvvm/data/model/post.dart';
import 'package:graphql_getx_mvvm/data/model/resource.dart';
import 'package:graphql_getx_mvvm/repository/author.dart';
import 'package:graphql_getx_mvvm/repository/post.dart';

class CreatePostViewModel extends GetxController {
  // find the viewModel in memory
  static CreatePostViewModel get to => Get.find();

  // non Observable variable
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // observable variable
  var isLoading = false.obs;
  var createPostResult = Resource<Post>(
    data: null,
    metadata: null,
    error: null,
  ).obs;

  var authorsResult = Resource<List<Author>>(
    data: [],
    metadata: null,
    error: null,
  ).obs;

  // ignore: unnecessary_cast
  final Rx<Author?> selectedAuthor = (null as Author?).obs;

  Future<Resource<Post>> onSubmit() {
    isLoading.value = true;
    return PostRepository()
        .createPost(
            titleController.text, bodyController.text, selectedAuthor.value!.id)
        .then((value) {
      isLoading.value = false;
      createPostResult.value.metadata = value.metadata;
      createPostResult.value.error = value.error;
      createPostResult.value.data = value.data;

      return createPostResult.value;
    });
  }

  void getAuthors() {
    isLoading.value = true;
    AuthorsRepository().getAuthors(null, null).then((value) {
      isLoading.value = false;
      authorsResult.value.metadata = value.metadata;
      authorsResult.value.error = value.error;
      authorsResult.value.data?.addAll(value.data!.map((e) => e));
    });
  }

  void selectAuthor(Author author) {
    selectedAuthor.value = author;
  }
}
