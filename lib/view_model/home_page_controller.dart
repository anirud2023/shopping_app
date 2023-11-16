import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController{
  RxString selectedValue = ''.obs;

  void onDropdownChanged(String? value) {
    if (value != null) {
      selectedValue.value = value;
    }
  }
}