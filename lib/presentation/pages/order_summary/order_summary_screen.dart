import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_hub_user/core/color/app_colors.dart';
import 'package:my_hub_user/core/constnats/constants.dart';
import 'package:my_hub_user/state_management/controllers/product_controller.dart';
import '../../../core/model/model_class.dart';
import '../add_delivery_address/add_delivery_address_screen.dart';

class OrderSummaryScreen extends StatelessWidget {
  OrderSummaryScreen({super.key});

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
        title: const Text("Order Summary"),
      ),
      body: SafeArea(
          child: Obx(
        () => Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(5),
          child: ListView(
            children: [
              productsDetails("Number of Products", "10", false),
              productsDetails("Order Total", '${controller.totalCount}', false),
              productsDetails("Delivery Fee", "0", false),
              productsDetails("Coupon Discount", "0", false),
              productsDetails(
                  "Payable Amount", '${controller.totalCount}', true),
              const SizedBox(
                height: 20,
              ),
              productsCouponCard(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => AddDeliveryAddressScreen());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(color: Colors.white, spreadRadius: 2)
                        ],
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: AppColors.primaryColor)),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "+ Delivery Address",
                        style: TextStyle(
                            color: AppColors.primaryColor, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget get bottomNavigationBar {
    return Card(
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
                    onPressed: () {},
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
          '${Constants.rupee + value}',
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
                "No Coupon",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
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
