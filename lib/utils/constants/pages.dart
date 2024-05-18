import 'package:get/get.dart';
import 'package:juice_code_test/pages/add_name_page/add_name_page.dart';
import 'package:juice_code_test/pages/get_image_page/get_image_page_binding.dart';

import '../../pages/DetectionListPage/detection_list_bindings.dart';
import '../../pages/DetectionListPage/detection_list_page.dart';
import '../../pages/add_name_page/add_name_page_binding.dart';
import '../../pages/get_image_page/get_image_page.dart';

abstract class AppPage {
  static List<GetPage> get pages => [
        GetPage(
          title: GetImagePage.title,
          name: GetImagePage.route,
          page: () => GetImagePage(),
          binding: GetImagePageBinding(),
        ),
        GetPage(
          title: AddNamePage.title,
          name: AddNamePage.route,
          page: () => AddNamePage(),
          binding: AddNamePageBinding(),
        ),
        GetPage(
          title: DetectionListPage.title,
          name: DetectionListPage.route,
          page: () =>  DetectionListPage(),
          binding: DetectionListBindings(),
        ),
      ];
}
