import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';

class FancyScroll extends StatelessWidget {
   FancyScroll({Key? key});

  final List<Map<String, dynamic>> accessories = [
    {'name': 'Rolex', 'image': 'lib/res/assets/image/rolex-463010_1280.jpg', 'price': 19.99},
    {
      'name': 'Accessory 2',
      'image': 'lib/res/assets/image/naviforce-waterproof-watch-3718331_1920.jpg',
      'price': 29.99
    },
    {
      'name': 'Accessory 2',
      'image': 'lib/res/assets/image/naviforce-waterproof-watch-3718331_1920.jpg',
      'price': 29.99
    },
    {
      'name': 'Accessory 2',
      'image': 'lib/res/assets/image/naviforce-waterproof-watch-3718331_1920.jpg',
      'price': 29.99
    },
    {
      'name': 'Accessory 2',
      'image': 'lib/res/assets/image/naviforce-waterproof-watch-3718331_1920.jpg',
      'price': 29.99
    },
    {
      'name': 'Accessory 2',
      'image': 'lib/res/assets/image/naviforce-waterproof-watch-3718331_1920.jpg',
      'price': 29.99
    },
    {
      'name': 'Accessory 2',
      'image': 'lib/res/assets/image/naviforce-waterproof-watch-3718331_1920.jpg',
      'price': 29.99
    },
    {
      'name': 'Accessory 2',
      'image': 'lib/res/assets/image/naviforce-waterproof-watch-3718331_1920.jpg',
      'price': 29.99
    },
    {
      'name': 'Accessory 2',
      'image': 'lib/res/assets/image/naviforce-waterproof-watch-3718331_1920.jpg',
      'price': 29.99
    },
    {
      'name': 'Accessory 2',
      'image': 'lib/res/assets/image/naviforce-waterproof-watch-3718331_1920.jpg',
      'price': 29.99
    },
    {
      'name': 'Accessory 2',
      'image': 'lib/res/assets/image/naviforce-waterproof-watch-3718331_1920.jpg',
      'price': 29.99
    },
    {
      'name': 'Accessory 2',
      'image': 'lib/res/assets/image/naviforce-waterproof-watch-3718331_1920.jpg',
      'price': 29.99
    },
    {
      'name': 'Accessory 2',
      'image': 'lib/res/assets/image/naviforce-waterproof-watch-3718331_1920.jpg',
      'price': 29.99
    },
    {
      'name': 'Accessory 2',
      'image': 'lib/res/assets/image/naviforce-waterproof-watch-3718331_1920.jpg',
      'price': 29.99
    },
    {
      'name': 'Accessory 2',
      'image': 'lib/res/assets/image/naviforce-waterproof-watch-3718331_1920.jpg',
      'price': 29.99
    },


    // Add more accessories as needed
  ];

  @override
  Widget build(BuildContext context) {
    double Height=Get.height;
    double width=Get.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Accessories Grid'),
              background: Image.asset(
                'lib/res/assets/image/istockphoto-650233226-1024x1024.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  final accessory = accessories[index];

                  return GestureDetector(
                    onTap: () {
                      // Handle accessory tap (you can navigate to a details page, for example)
                      print('Tapped on ${accessory['name']}');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            accessory['image'],
                            height: 115.0,
                            width: 100.0,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            accessory['name'],
                            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4.0),
                          Text('\$${accessory['price'].toStringAsFixed(2)}'),
                        ],
                      ),
                    ),
                  );
                },
                childCount: accessories.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
