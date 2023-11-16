import 'package:decorated_dropdownbutton/decorated_dropdownbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/custom_widget/my_adv_card.dart';
import 'package:shopping_app/view/custom_widget/see_all.dart';
import 'package:shopping_app/view/custom_widget/sroll_page.dart';
import 'package:shopping_app/view_model/home_page_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height=Get.height;
    double width=Get.width;
    final HomePageController controller = Get.put(HomePageController());

    String selectedCategory = 'all';

    return Scaffold(
      body:  SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding:  EdgeInsets.only(top:height*0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: width*0.03,right: width*0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon:  const Icon(Icons.search,color: Colors.black,size: 30,),
                        onPressed: () {},
                      ),
                      DecoratedDropdownButton(
                        border: Border.all(color: const Color(0xFFCCCCCC),width: 1.5),
                        borderRadius: BorderRadius.circular(40.0),
                        iconPadding:  EdgeInsets.only(left: width*0.005,right: width*0.005),
                        padding:  EdgeInsets.only(left: width*0.1,top: height*0.003 ,bottom: height*0.003,right: width*0.06),
                        isExpanded: false,
                        value: "item1",
                        items: const [
                          DropdownMenuItem(value: "item1", child: Text("Man",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                          // DropdownMenuItem(value: "item2", child:  Text("Woman")),
                          DropdownMenuItem(value: "item2", child:  Text("All")),
                        ],
                        onChanged: (value) {
                          print("You selected $value");
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.shopping_bag,color: Colors.black,size: 30,),
                        onPressed: () {
                          // Implement bag icon functionality here
                          print('Bag button pressed');
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height*0.04,),
                Padding(
                  padding:  EdgeInsets.only(left: width*0.03),
                  child:  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi,Alex!",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                      Text("New Collection From Versace",style: TextStyle(color: Colors.grey,fontSize: 21),)
                    ],
                  ),
                ),
                SizedBox(height: height*0.03,),
                 MyCard(),
                  HomeScroller(),

              ],
            ),
          ),
        ),
      ),
      floatingActionButton:  SizedBox(
    width: 350.0, // Adjust the width
    height: 75.0, // Adjust the height
    child:FloatingActionButton.extended(
        onPressed: () {
          // Handle button press
         Get.to(FancyScroll(),transition: Transition.rightToLeft);
        },
        label: const Text('See All Accessories'),
        icon: const Icon(Icons.arrow_forward),
        backgroundColor: Colors.black,
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
