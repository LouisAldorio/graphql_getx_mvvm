import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/binding/comment.dart';
import 'package:graphql_getx_mvvm/binding/post.dart';
import 'package:graphql_getx_mvvm/constant/router.dart';
import 'package:graphql_getx_mvvm/ui/pages/authors/authors_page.dart';
import 'package:graphql_getx_mvvm/ui/pages/comments/comments_page.dart';
import 'package:graphql_getx_mvvm/ui/pages/posts/posts_page.dart';

class BottomNavigationRouter extends GetxController {
  static BottomNavigationRouter get to => Get.find();

  var currentIndex = 0.obs;

  final pages = <String>[
    RouterConst.POSTS_ROUTE,
    RouterConst.COMMENTS_ROUTE,
    RouterConst.AUTHORS_ROUTE
  ];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index],
        id: RouterConst
            .BOTTOM_NAVIGATION_KEY); // id is used to identify which navigator is bind to this router
  }

  Route? onGenerateRoute(RouteSettings settings) {
    print(settings.name);

    if (settings.name == RouterConst.POSTS_ROUTE) {
      return GetPageRoute(
        settings: settings,
        page: () => Posts(),
        binding: PostsBinding(),
        transition: Transition.zoom,
      );
    }

    if (settings.name == RouterConst.COMMENTS_ROUTE) {
      return GetPageRoute(
          settings: settings,
          page: () => Comments(),
          binding: CommentBinding(),
          transition: Transition.zoom);
    }

    if (settings.name == RouterConst.AUTHORS_ROUTE) {
      return GetPageRoute(
        settings: settings,
        page: () => Authors(),
        // binding: SettingsBinding(),
      );
    }

    return null;
  }
}
