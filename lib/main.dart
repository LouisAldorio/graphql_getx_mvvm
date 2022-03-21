import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/binding/home.dart';
import 'package:graphql_getx_mvvm/binding/post.dart';
import 'package:flutter/services.dart';
import 'package:graphql_getx_mvvm/ui/pages/home/home_page.dart';
import 'package:graphql_getx_mvvm/ui/pages/post_detail/post_detail_page.dart';
import 'package:graphql_getx_mvvm/ui/pages/create_post/create_post_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey[400],
  ));

  runApp(Root());
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/home",
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(
          name: '/home',
          page: () => Home(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: "/post-detail",
          page: () => PostDetail(),
          binding: PostBinding(),
        ),
        GetPage(
          name: "/create-post",
          page: () => CreatePostForm(),
          binding: CreatePostFormBinding(),
          transition: Transition.cupertino
        )
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF9F8FD),
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(color: Color(0xFF0C9869)),
        typography: Typography.material2018(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Flutter Graphql GetX MVVM',
    );
  }
}
