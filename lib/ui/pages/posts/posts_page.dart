import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/ui/components/post_card.dart';
import 'package:graphql_getx_mvvm/ui/pages/posts/posts_view_model.dart';

class Posts extends StatelessWidget {
  Posts({Key? key}) : super(key: key);

  final int limit = 5;
  int page = 1;
  final ScrollController scrollController = ScrollController();
  final PostsViewModel viewModel = Get.put(PostsViewModel());

  @override
  Widget build(BuildContext context) {

    return Obx(
      () => Container(
        child: viewModel.isLoading.value && viewModel.result.value.data!.isEmpty
            ? Center(
                child: SpinKitWave(
                  color: Colors.green,
                  size: 60.0,
                ),
              )
            : NotificationListener(
                child: Builder(
                    builder: (context) => ListView.builder(
                        itemCount: page <
                                viewModel.result.value.metadata!.totalPages!
                                    .toInt()
                            ? viewModel.result.value.data!.length + 1
                            : viewModel.result.value.data!.length,
                        controller: scrollController,
                        itemBuilder: (context, index) {
                          if (index == viewModel.result.value.data!.length &&
                              page <=
                                  viewModel.result.value.metadata!.totalPages!
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
                          final post = viewModel.result.value.data![index];

                          return PostCard(
                            id: post.id,
                            title: post.title,
                            body: post.body,
                            author: post.author.name,
                          );
                        })),
                onNotification: (dynamic t) {
                  if (t is ScrollEndNotification &&
                      scrollController.position.pixels >=
                          scrollController.position.maxScrollExtent * 0.8 &&
                      !viewModel.isLoading.value &&
                      page <
                          viewModel.result.value.metadata!.totalPages!
                              .toInt()) {
                    page += 1;
                    viewModel.getPosts(page, limit);
                  }
                  return true;
                }),
      ),
    );
  }
}
