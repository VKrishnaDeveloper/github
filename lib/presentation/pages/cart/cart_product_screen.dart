import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_hub_user/core/color/app_colors.dart';
import 'package:my_hub_user/core/constnats/constants.dart';
import 'package:my_hub_user/state_management/controllers/product_controller.dart';
import '../../../core/model/model_class.dart';
import '../order_summary/order_summary_screen.dart';

class CartProductsScreen extends StatelessWidget {
  CartProductsScreen({super.key});

  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.whiteColor,
              )),
          title: const Text("My Cart"),
        ),
        body: SafeArea(
            child: Obx(
          () => Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            child: Expanded(
              child: ListView(
                children: [
                  Flexible(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: controller.cartProducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CartProductCard(
                            controller: controller,
                            product:
                                controller.cartProducts.keys.toList()[index],
                            quantity:
                                controller.cartProducts.values.toList()[index],
                            index: index,
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                  productsDetails("Number of Products", "10", false),
                  productsDetails(
                      "Order Total", '${controller.totalCount}', false),
                  productsDetails("Delivery Fee", "0", false),
                  productsDetails("Coupon Discount", "0", false),
                  productsDetails(
                      "Payable Amount", '${controller.totalCount}', true),
                  productsCouponCard()
                ],
              ),
            ),
          ),
        )),
        bottomNavigationBar: bottomNavigationBar);
  }

  Widget get bottomNavigationBar {
    return Obx(
      () => Card(
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        color: Colors.white,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              border: Border.all(color: AppColors.gray_4),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${controller.totalCount}',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Get.to(() => OrderSummaryScreen());
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 40.0,
                        width: 140.0,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: -12.0,
                                blurRadius: 12.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(80.0),
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 34, 167, 255),
                              Color.fromARGB(255, 41, 87, 255)
                            ])),
                        padding: const EdgeInsets.all(0),
                        child: const Text(
                          "Proceed",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

Widget productsDetails(String text, String value, bool bold) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style:
              TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal),
        ),
        Text(
          Constants.rupee + " " + value,
          style:
              TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal),
        )
      ],
    ),
  );
}

Widget productsCouponCard() {
  return const Card(
    elevation: 2,
    shadowColor: Color.fromARGB(255, 14, 63, 103),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.countertops_outlined,
                color: AppColors.primaryColor,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Apply Coupon",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final MyHubProductsModel product;
  final int quantity;
  final int index;
  const CartProductCard(
      {super.key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                  height: 60,
                  width: 60,
                  child:
                      CircleAvatar(child: Image.asset(product.productImage))),
              const SizedBox(
                width: 20,
              ),
              Expanded(child: Text(product.productTitle)),
              IconButton(
                  onPressed: () {
                    controller.removeProducts(product);
                  },
                  icon: const Icon(Icons.remove_circle_outline)),
              Text("${quantity}"),
              IconButton(
                  onPressed: () {
                    controller.addProduct(product);
                  },
                  icon: const Icon(Icons.add_circle_outline)),
            ],
          ),
        ],
      ),
    );
  }
}
