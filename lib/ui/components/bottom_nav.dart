import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/store/global.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalState gState = Get.put(GlobalState());

    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Homes',
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
        currentIndex: gState.bottomNavigationIndex.toInt(),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          gState.mutateBottomNavigationIndex(index);
        },
      ),
    );
  }
}
