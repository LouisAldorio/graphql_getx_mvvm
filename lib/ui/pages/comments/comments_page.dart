import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/ui/components/comment_card.dart';
import 'package:graphql_getx_mvvm/ui/pages/comments/comments_view_model.dart';

class Comments extends GetView<CommentsViewModel> {
  Comments({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          child: controller.isLoading.value &&
                  controller.result.value.data!.isEmpty
              ? Center(
                  child: SpinKitWave(
                    color: Colors.green,
                    size: 60.0,
                  ),
                )
              : NotificationListener(
                  child: Builder(
                    builder: (context) => ListView.builder(
                      itemCount: controller.page <
                              controller.result.value.metadata!.totalPages!
                                  .toInt()
                          ? controller.result.value.data!.length + 1
                          : controller.result.value.data!.length,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        if (index == controller.result.value.data!.length &&
                            controller.page <=
                                controller.result.value.metadata!.totalPages!
                                    .toInt()) {
                          return Center(
                            child: Container(
                              margin: EdgeInsets.all(20),
                              child: SpinKitWave(
                                color: Colors.green,
                                size: 35.0,
                              ),
                            ),
                          );
                        }

                        // Show your info
                        final comment = controller.result.value.data![index];

                        return CommentCard(
                          comment: comment,
                        );
                      },
                    ),
                  ),
                  onNotification: (dynamic t) {
                    if (t is ScrollEndNotification &&
                        scrollController.position.pixels >=
                            scrollController.position.maxScrollExtent * 0.8 &&
                        !controller.isLoading.value &&
                        controller.page <
                            controller.result.value.metadata!.totalPages!
                                .toInt()) {
                      controller.loadNextPage();
                    }
                    return true;
                  },
                ),
        );
      },
    );
  }
}
