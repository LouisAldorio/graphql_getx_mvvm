import 'package:graphql_getx_mvvm/constant/router.dart';
import 'package:graphql_getx_mvvm/ui/components/floating_action_button.dart';
import 'package:graphql_getx_mvvm/router/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/ui/pages/home/bottom_navigation.dart';

class Home extends GetView<BottomNavigationRouter> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(RouterConst.BOTTOM_NAVIGATION_KEY),
        initialRoute: RouterConst.POSTS_ROUTE,
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: CustomBottomNavigation(),
      floatingActionButton: CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }
}