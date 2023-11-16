import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  // Rx variable for reactive state
  RxString selectedCategory = 'Accessories'.obs;
}


class HomeScroller extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  // Sample data
  final Map<String, List<Map<String, dynamic>>> categories = {
    'Accessories': [
      {
        'name': 'Hat',
        'price': 20.0,
        'image': 'lib/res/assets/image/rolex-463010_1280.jpg'
      },
      {
        'name': 'Sunglasses',
        'price': 50.0,
        'image': 'lib/res/assets/image/naviforce-waterproof-watch-3718331_1920.jpg'
      },
      {
        'name': 'Watch',
        'price': 100.0,
        'image': 'lib/res/assets/image/clock-3005574_1280.jpg'
      },
    ],
    'Clothing': [
      {
        'name': 'T-shirt',
        'price': 30.0,
        'image': 'lib/res/assets/images/bao-bao-GREEBEtyR9Y-unsplash.jpg'
      },
      {
        'name': 'Jeans',
        'price': 60.0,
        'image': 'lib/res/assets/images/bao-bao-mlKE8dEMc_8-unsplash.jpg'
      },
      {
        'name': 'Jacket',
        'price': 120.0,
        'image': 'lib/res/assets/images/sincerely-media-9ShY-Tq70Mc-unsplash.jpg'
      },
    ],
    'Footwear': [
      {'name': 'Shoes', 'price': 80.0, 'image': 'assets/shoes.png'},
      {'name': 'Sneakers', 'price': 90.0, 'image': 'assets/sneakers.png'},
      {'name': 'Sandals', 'price': 40.0, 'image': 'assets/sandals.png'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    double Height=Get.height;
    double width=Get.width;

    return Column(
      children: [
        // Scrollable category selection
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: categories.keys
                .map(
                  (category) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        // Update the selected category using the controller
                        controller.selectedCategory.value = category;
                      },
                      child:  Obx(() {
                        final totalItems = categories[category]?.length ?? 0;
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                          width: 150,
                          decoration: BoxDecoration(
                            color: controller.selectedCategory.value == category ? Colors.white : Colors.transparent,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (totalItems > 0)
                                const Padding(
                                  padding:  EdgeInsets.only(right:5.0),
                                  child: Text(
                                    // totalItems.toString(),
                                    "125",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    category,
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: controller.selectedCategory.value == category ? Colors.black : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
            )
                .toList(),
            ),
        ),
        // Display items based on the selected category
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(() {
            return Row(
              children: categories[controller.selectedCategory.value]!
                  .map(
                    (item) =>
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 180.0,
                        height: 240,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              item['image'],
                              height: 150.0,
                              width: 150.0,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              item['name'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              '\$${item['price']}',
                              style: TextStyle(color: Colors.green),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //   children: [
                            //     ElevatedButton(
                            //       onPressed: () {
                            //         // Add to Cart functionality
                            //       },
                            //       child: Text('Add to Cart'),
                            //     ),
                            //     IconButton(
                            //       onPressed: () {
                            //         // Like functionality
                            //       },
                            //       icon: Icon(Icons.favorite),
                            //       color: Colors.red,
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
              )
                  .toList(),
            );
          }),
        ),
      ],
    );
  }
}