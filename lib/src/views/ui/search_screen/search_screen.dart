import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: ColorsValue.primaryColor,
          child: const Icon(
            Icons.history,
          ),
        ),
      );
}
