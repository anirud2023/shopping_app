import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  final List<String> imagePaths = [
    "lib/res/assets/image/redowan-dhrubo-HPAEWdeo_RI-unsplash.jpg",
    "lib/res/assets/image/saif71-com-brqTWpFkmSQ-unsplash.jpg",
  ];

  RxInt currentIndex = 0.obs;

  void changeImage() {
    currentIndex.value = (currentIndex.value + 1) % imagePaths.length;
  }
}

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('building');
    double height=Get.height;
    double width= Get.width;
    return GetBuilder<MyController>(
      init: MyController(),
      builder: (controller) => Obx(
            () {
          double height = Get.height;
          double width = Get.width;

          Future.delayed(const Duration(seconds: 5), () {
            controller.changeImage();
          });

          return Padding(
            padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
            child: Container(
              height: height * 0.25,
              width: 360,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: const Color(0xFFCCCCCC), // Set the border color
                  width: 1.2, // Set the border width
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    child: ClipRRect(
                      key: ValueKey<int>(controller.currentIndex.value),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                      child: Image.asset(
                        controller.imagePaths[controller.currentIndex.value],
                        height: 250,
                        width: 280,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle arrow button tap
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0),
                      width: 55,
                      height: 45,
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
