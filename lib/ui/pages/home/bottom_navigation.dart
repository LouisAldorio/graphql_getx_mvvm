import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/router/bottom_navigation.dart';

class CustomBottomNavigation extends GetView<BottomNavigationRouter> {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Obx(
          () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: 'Comments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            label: 'Author',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: '',
          ),
        ],
        currentIndex: controller.currentIndex.value,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: controller.changePage,
      ),
    );
  }
}


