import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/binding/comment.dart';
import 'package:graphql_getx_mvvm/binding/post.dart';
import 'package:graphql_getx_mvvm/ui/pages/authors/authors_page.dart';
import 'package:graphql_getx_mvvm/ui/pages/comments/comments_page.dart';
import 'package:graphql_getx_mvvm/ui/pages/posts/posts_page.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();

  var currentIndex = 0.obs;

  final pages = <String>['/posts', '/comments', '/authors'];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/posts') {
      return GetPageRoute(
        settings: settings,
        page: () => Posts(),
        binding: PostBinding(),
      );
    }

    if (settings.name == '/comments') {
      return GetPageRoute(
        settings: settings,
        page: () => Comments(),
        binding: CommentBinding(),
      );
    }

    if (settings.name == '/authors') {
      return GetPageRoute(
        settings: settings,
        page: () => Authors(),
        // binding: SettingsBinding(),
      );
    }

    return null;
  }
}