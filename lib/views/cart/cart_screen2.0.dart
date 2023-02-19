import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/cart_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/login_controller.dart';
import 'package:lime_light_copy_shopify_store/views/checkout/pre_checkout_screen.dart';
import 'package:lime_light_copy_shopify_store/views/login/pages/login_page.dart';

class CartScreen2 extends StatelessWidget {
  CartScreen2({Key? key}) : super(key: key);

  final cartController = Get.find<CartController>();
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.white, fontSize: 21),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            GetX<CartController>(builder: (controller) {
              return SizedBox(
                width: size.width,
                height: size.height * 0.62,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    if (controller.cartModelItems.isNotEmpty)
                      GetX<CartController>(
                          builder: (controller) => ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(5),
                                children: controller.cartModelItems
                                    .map((cartModelElement) {
                                  return Dismissible(
                                      background: Container(
                                        color: Colors.red,
                                        child:
                                            const Icon(CupertinoIcons.delete),
                                      ),
                                      key: ValueKey(cartModelElement),
                                      onDismissed:
                                          (DismissDirection direction) {
                                        controller.removeItem(cartModelElement);
                                      },
                                      confirmDismiss:
                                          (DismissDirection direction) async {
                                        return await showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              icon: const Icon(
                                                  Icons.warning_amber_outlined),
                                              iconColor: Colors.red,
                                              title: const Text('Are you Sure'),
                                              content: Text(
                                                  'Do you really want to remove '
                                                  '${cartModelElement.product.title} from the cart?'),
                                              actions: <Widget>[
                                                ElevatedButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(true),
                                                    child:
                                                        const Text("Confirm")),
                                                OutlinedButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(false),
                                                  child: const Text("Cancel"),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 30),
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 200,
                                                width: size.width,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  // color: Colors.grey.shade100,
                                                ),
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            cartModelElement
                                                                .product
                                                                .images
                                                                .first
                                                                .originalSrc,
                                                        placeholder: (context,
                                                                url) =>
                                                            Image.asset(
                                                                'assets/images/lime-light-logo.png',
                                                                fit: BoxFit
                                                                    .cover),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            const Icon(
                                                                Icons.error),
                                                        fit: BoxFit.fill,
                                                        width: 160,
                                                        height: 180,
                                                      ),
                                                    ),
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            cartModelElement
                                                                    .product
                                                                    .collectionList
                                                                    ?.first
                                                                    .title ??
                                                                '',
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 21),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          SizedBox(
                                                            width: 200,
                                                            child: Flexible(
                                                              fit:
                                                                  FlexFit.loose,
                                                              flex: 2,
                                                              child: Text(
                                                                cartModelElement
                                                                    .product
                                                                    .title,
                                                                softWrap: true,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          cartModelElement
                                                                      .product
                                                                      .option
                                                                      .length >
                                                                  1
                                                              ? Text(
                                                                  '${cartModelElement.product.option.first.name}/${cartModelElement.product.option[1].name} : ${cartModelElement.productVariant.title}',
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black45,
                                                                      fontSize:
                                                                          13),
                                                                )
                                                              : Text(
                                                                  '${cartModelElement.product.option.first.name} : ${cartModelElement.productVariant.title}',
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black45,
                                                                      fontSize:
                                                                          13),
                                                                ),
                                                          const SizedBox(
                                                            height: 12,
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Icon(
                                                                CupertinoIcons
                                                                    .money_dollar,
                                                                color: Colors
                                                                    .orange,
                                                                size: 28,
                                                              ),
                                                              Text(
                                                                cartModelElement
                                                                    .productVariant
                                                                    .price
                                                                    .amount
                                                                    .toStringAsFixed(
                                                                        2),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                  height: 28,
                                                                  width: 83,
                                                                  child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomLeft,
                                                                    children: [
                                                                      Align(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              17,
                                                                          width:
                                                                              51,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.grey.shade100,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          cartController
                                                                              .increaseQuantity(cartModelElement);
                                                                        },
                                                                        child:
                                                                            Align(
                                                                          alignment:
                                                                              Alignment.centerRight,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                ShapeDecoration(
                                                                              color: Colors.grey.shade100,
                                                                              shape: const CircleBorder(
                                                                                side: BorderSide(color: Colors.white, width: 3, style: BorderStyle.solid),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                const Icon(
                                                                              CupertinoIcons.plus,
                                                                              size: 20,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          cartController
                                                                              .decreaseQuantity(cartModelElement);
                                                                        },
                                                                        child:
                                                                            Align(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                ShapeDecoration(
                                                                              color: Colors.grey.shade100,
                                                                              shape: const CircleBorder(
                                                                                side: BorderSide(color: Colors.white, width: 3, style: BorderStyle.solid),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                const Icon(
                                                                              CupertinoIcons.minus,
                                                                              size: 20,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        child:
                                                                            Text(
                                                                          cartModelElement
                                                                              .quantity
                                                                              .toString(),
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          textAlign:
                                                                              TextAlign.left,
                                                                          style: const TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w500,
                                                                              color: Colors.black),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ]),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )));
                                }).toList(),
                              ))
                    else
                      Column(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 35.0),
                              child: Text('Your Cart is Empty',
                                  style: TextStyle(fontSize: 20)),
                            ),
                          ),
                          Container(
                            width: 180,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Get.offNamed('/mainScreen');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              child: const Text(
                                'Start Shopping',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              );
            }),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width,
                height: 140,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style:
                                TextStyle(color: Colors.black45, fontSize: 24),
                          ),
                          GetX<CartController>(builder: (controller) {
                            return Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.money_dollar,
                                  size: 28,
                                  color: Colors.orange,
                                ),
                                Text(
                                  controller.totalCost.toStringAsFixed(2),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (cartController.cartModelItems.isEmpty) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Cart Empty'),
                                    content: const Text(
                                        'You must add products to cart for checkout.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                });
                          }

                          if (loginController.currentUser.id!.isNotEmpty) {
                            Get.to(() => PreCheckoutScreen(
                                cartModelItems:
                                    cartController.cartModelItems.value));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Warning'),
                                    content: const Text(
                                        'You must log in to complete checkout.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Get.to(() => LoginPage(previousPage: "cartScreen"));
                                        },
                                        child: const Text('Login'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                    ],
                                  );
                                });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 10,
                            minimumSize: Size(size.width - 21, 50)),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
