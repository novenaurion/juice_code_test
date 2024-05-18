import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juice_code_test/pages/get_image_page/get_image_page.dart';
import 'package:juice_code_test/utils/responsive_layout.dart';
import 'package:juice_code_test/widgets/custom_button_view.dart';

import 'detection_list_controller.dart';


class DetectionListPage extends GetView {
   DetectionListPage({super.key});

  static String get route => '/user-list';
  static String get title => 'Get List Page';

  final DetectionListController mUserListController = Get.find<DetectionListController>();

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveLayout.isMobile(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detections Lists"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                CustomButtonView(
                  key: Key("add-new-button"),
                  width: 200,
                  buttonText: "Add New Detection",
                  onPressed: () {
                    Get.toNamed(GetImagePage.route);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                  top: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildHeaderCell('User Name'),
                  buildHeaderCell('Image'),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder(
                  stream: mUserListController.getUser(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                        ),
                      );
                    } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text(
                          "There is no data",
                        ),
                      );
                    } else {
                      return SingleChildScrollView(
                        child: ListView.builder(
                          key: Key("detection-list"),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot
                              .data!.docs.length, // +1 for the header row
                          itemBuilder: (context, index) {
                            DocumentSnapshot document =
                                snapshot.data!.docs[index];
                            // Data rows
                            return Container(
                              height: 60,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  buildDataCell(document['name']),
                                  buildDataCellWithImage(document['photo']),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildHeaderCell(String label) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.black),
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget buildDataCell(String? value) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(
          // right: BorderSide(color: Colors.black),
          left: BorderSide(color: Colors.black),
        ),
      ),
      child: Center(
          child: Text(
        value ?? '',
      )),
    ),
  );
}

Widget buildDataCellWithImage(String? imgUrl) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.black),
        ),
      ),
      child: CachedNetworkImage(
        imageUrl: imgUrl!,
        height: 50,
        placeholder: (context,url) => Center(child: CircularProgressIndicator()),
        errorWidget:(context,error,url)=> Icon(Icons.error),
      ),
    ),
  );
}
