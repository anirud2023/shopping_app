import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/custom_widget/my_text.dart';
import 'package:shopping_app/view/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../view_model/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("building");
    double height = Get.height;
    double width = Get.width;
    AutoScrollPageController autoScrollController = Get.put(AutoScrollPageController());

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Padding(
            padding:  EdgeInsets.only(left: width*0.04,top: height*0.055),
            child: const TextBox(
              name: "New Collection\nSpring 2021",
              Size: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
            SizedBox(height: height*0.06,),
            Padding(
              padding:  EdgeInsets.only(left:width*0.04,right: width*0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   SmoothPageIndicator(
                    controller: autoScrollController.pageController,
                    count: 6, // Specify the number of pages
                    effect: const ExpandingDotsEffect(
                        spacing:  15.0,
                        radius:  10.0,
                        dotWidth:  9.0,
                        dotHeight:  8.0,
                        // paintStyle:  PaintingStyle.stroke,
                        strokeWidth:  1.5,
                        dotColor: Colors.grey,
                        activeDotColor:  Colors.black
                    ),
                    // You can choose different effects
                  ),
                  FloatingActionButton(onPressed: (){
                    Get.to(const HomePage(),transition: Transition.rightToLeft);
                  },backgroundColor: Colors.black,foregroundColor: Colors.white,mini: false,
                  child:const Icon(Icons.arrow_forward_ios_outlined),)
                ],
              ),
            ),
          SizedBox(height: height*0.07,),
          SizedBox(
            height: height*0.61,
            width: width*05,
            child: GetBuilder<AutoScrollPageController>(
            builder:(controller) {
              return PageView(
                controller: controller.pageController,
                onPageChanged: (index) {
                  controller.currentPage.value = index;
                },
                children: [
                  SizedBox(height: 30, width: 30, child: Image.asset(
                    "lib/res/assets/image/amir-soltani-1_zIOXwhW64-unsplash.jpg",
                    fit: BoxFit.cover,),),
                  SizedBox(height: 30, width: 30, child: Image.asset(
                    "lib/res/assets/image/andi-rieger-zo_CXwb72Sg-unsplash.jpg",
                    fit: BoxFit.cover,)),
                  SizedBox(height: 30, width: 30, child: Image.asset(
                    "lib/res/assets/image/sami-sadeghi-hsAHR6o6OIs-unsplash.jpg",
                    fit: BoxFit.cover,),),
                  SizedBox(height: 30, width: 30, child: Image.asset(
                    "lib/res/assets/image/bryan-delgado-m5N0DEPlAWg-unsplash.jpg",
                    fit: BoxFit.cover,),),
                  SizedBox(height: 30, width: 30, child: Image.asset(
                    "lib/res/assets/image/jacob-blankenship-lfJil4DrWRU-unsplash.jpg",
                    fit: BoxFit.cover,),),
                  SizedBox(height: 30, width: 30, child: Image.asset(
                    "lib/res/assets/image/sven-ciupka-RavbKCbzlXY-unsplash.jpg",
                    fit: BoxFit.cover,),)
                ],
              );
            }
          ),
        )

        ]),
      ),
    ));
  }
}
