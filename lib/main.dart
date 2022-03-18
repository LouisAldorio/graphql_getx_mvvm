import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import "package:graphql_getx_mvvm/data/network/graphql/client.dart";
import 'package:flutter/services.dart';
import 'package:graphql_getx_mvvm/store/global.dart';
import 'package:graphql_getx_mvvm/ui/components/bottom_nav.dart';
import 'package:graphql_getx_mvvm/ui/components/fab.dart';
import 'package:graphql_getx_mvvm/ui/pages/authors/authors_page.dart';
import 'package:graphql_getx_mvvm/ui/pages/post_detail/post_detail_page.dart';
import 'package:graphql_getx_mvvm/ui/pages/posts/posts_page.dart';
import 'package:graphql_getx_mvvm/ui/pages/comments/comments_page.dart';

Future<void> main() async {
  // required for testing purpose
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  // await initHiveForFlutter();
  runApp(Root());
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //GraphQLConfig init
    ValueNotifier<GraphQLClient> client = GraphQLConfig.graphInit();

    return GraphQLProvider(
      client: client,
      child: GetMaterialApp(
        getPages: [
          GetPage(name: "/posts", page: () => Posts()),
          GetPage(name: "/comments", page: () => Comments()),
          GetPage(name: "/authors", page: () => Authors()),
          GetPage(name: "/post-detail", page: () => PostDetail())
        ],
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFF9F8FD),
          primarySwatch: Colors.green,
          appBarTheme: AppBarTheme(color: Color(0xFF0C9869)),
          typography: Typography.material2018(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        title: 'Flutter Graphql GetX MVVM',
        home: Main(),
      ),
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  static final List<Widget> _widgetOptions = <Widget>[
    Posts(),
    Comments(),
    Authors(),
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalState gState = Get.put(GlobalState());

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Obx(
            () => AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: _widgetOptions.elementAt(
                gState.bottomNavigationIndex.toInt() > _widgetOptions.length - 1
                    ? _widgetOptions.length - 1
                    : gState.bottomNavigationIndex.toInt(),
              ),
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
              ) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(),
      floatingActionButton: CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }
}
