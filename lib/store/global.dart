import 'package:get/get.dart';

class GlobalState extends GetxController {
  // reactive state variables
  var bottomNavigationIndex = 0.obs;
  mutateBottomNavigationIndex(int index) {
    bottomNavigationIndex.value = index;
  }
}
