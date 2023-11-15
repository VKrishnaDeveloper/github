import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_hub_user/state_management/controllers/product_controller.dart';

class TotalCartCountScreen extends StatelessWidget {
  final CartController controller = Get.find();
  TotalCartCountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '${controller.totalCount}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
