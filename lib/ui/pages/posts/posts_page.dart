import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/ui/pages/posts/post_view_model.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class Posts extends StatelessWidget {
  Posts({Key? key}) : super(key: key);

  final PostsViewModel viewModel = Get.put(PostsViewModel(
    page: 1,
    limit: 10,
  ));

  @override
  Widget build(BuildContext context) {

    print(viewModel.result.value.data!.isEmpty);

    return Obx(
      () => Container(
        child: Conditional.single(
          context: context,
          conditionBuilder: (BuildContext context) => viewModel.result.value.data!.isEmpty,
          widgetBuilder: (BuildContext context) => Center(
            child: SpinKitWave(
              color: Colors.green,
              size: 60.0,
            ),
          ),
          fallbackBuilder: (BuildContext context) => ListView.builder(
            itemBuilder: (context, index) {
              final post = viewModel.result.value.data![index];

              return ListTile(
                title: Text(post.title!),
                subtitle: Text(post.body!),
              );
            },
            itemCount: viewModel.result.value.data?.length,
          ),
        ),
      ),
    );
  }
}
