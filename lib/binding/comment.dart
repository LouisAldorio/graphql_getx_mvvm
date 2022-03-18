import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/ui/pages/comments/comments_view_model.dart';

class CommentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommentsViewModel());
  }
}