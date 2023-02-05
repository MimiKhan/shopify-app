import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  int quantity = 1;

  var subtotal = 0.0;

  CartScreen({Key? key}) : super(key: key);

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            if (cartController.cartItems.isNotEmpty)
              GetX<CartController>(
                builder: (controller) {
                  return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Bag Total : ${controller.totalPrice}",
                          style: const TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      );
                }
              ) else const Text(''),
            if (cartController.cartItems.isNotEmpty)
              GetX<CartController>(
                  builder: (controller) => ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(5),
                        children: controller.cartItems.keys.map((product) {
                          return Dismissible(
                            background: Container(
                              color: Colors.red,
                              child: const Icon(CupertinoIcons.delete),
                            ),
                            key: ValueKey(product),
                            onDismissed: (DismissDirection direction) {
                              controller.removeProduct(product);
                            },
                            confirmDismiss: (DismissDirection direction) async {
                              return await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    icon: const Icon(
                                        Icons.warning_amber_outlined),
                                    iconColor: Colors.red,
                                    title: const Text('Are you Sure'),
                                    content:
                                        Text('Do you really want to remove '
                                            '${product.title} from the cart?'),
                                    actions: <Widget>[
                                      ElevatedButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                          child: const Text("Confirm")),
                                      OutlinedButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: const Text("Cancel"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: ListTile(
                                  leading: Image.network(
                                    product.images[0].originalSrc,
                                    width: 70,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  title: Text(
                                    product.title,
                                    softWrap: true,
                                  ),
                                  subtitle: Text(
                                    '\$${product.productVariants.first.price.amount}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  trailing: Container(
                                    width: 100,
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: ()=>controller.decrementQuantity(product),
                                              child: const Icon(CupertinoIcons.minus_circle),
                                            ),
                                            Text(
                                              controller.cartItems[product]
                                                  .toString(),
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            ),
                                            GestureDetector(
                                              onTap: ()=>controller.incrementQuantity(product),
                                              child: const Icon(CupertinoIcons.plus_circle),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '\$${product.productVariants.first.price.amount * controller.cartItems[product]!.toDouble()}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ))
            else
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 35.0),
                  child: Text('Your Cart is Empty',
                      style: TextStyle(fontSize: 20)),
                ),
              ),
          ],
        ),
      ),
    );
  }

/*void _showDialog(BuildContext context, int listViewIndex) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Are you Sure'),

            // titlePadding: EdgeInsets.all(8),
            // titleTextStyle: TextStyle(fontSize: 15,color: Colors.black),
            content: Text(
                'Do you really want to remove ${cartController.cartItems[listViewIndex].title} from the cart?'),
            // contentPadding: EdgeInsets.all(8),
            // contentTextStyle: TextStyle(fontSize: 13,color: Colors.black),
            // shape: RoundedRectangleBorder(),
            // icon: Icon(Icons.warning,color: Colors.red,),
            actions: [
              MaterialButton(
                onPressed: () {
                  cartController.cartItems.removeAt(listViewIndex);
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('CANCEL'),
              ),
            ],
          );
        });
  }*/

/*Container(
                              child: Row(
                                children: [
                                  Image(
                                    image: NetworkImage(controller
                                        .cartItems[listViewIndex]
                                        .images[0]
                                        .originalSrc),
                                    height: 110,
                                    width: 110,
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high,
                                  ),
                                  Column(
                                    children: [
                                      Text(controller
                                          .cartItems[listViewIndex].title),
                                      Text(controller
                                          .cartItems[listViewIndex]
                                          .productVariants
                                          .first
                                          .price
                                          .formattedPrice),
                                    ],
                                  ),
                                ],
                              ),
                            )*/
/*
* ListView.builder(
                itemCount: cartController.cartItems.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (_, int listViewIndex) {
                  return GetX<CartController>(builder: (controller) {

                    return Dismissible(
                      background: Container(
                        color: Colors.red,
                        child: const Icon(CupertinoIcons.delete),
                      ),
                      key: ValueKey(controller.cartItems[listViewIndex]),
                      onDismissed: (DismissDirection direction) {
                        controller.removeProduct(controller.cartItems.);
                      },
                      confirmDismiss: (DismissDirection direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              icon: const Icon(Icons.warning_amber_outlined),
                              iconColor: Colors.red,
                              title: const Text('Are you Sure'),
                              content: Text(
                                  'Do you really want to remove '
                                      '${cartController.cartItems.keys.} from the cart?'),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: const Text("Confirm")),
                                OutlinedButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text("Cancel"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            leading: Image.network(
                              controller.cartItems[listViewIndex].images[0]
                                  .originalSrc,
                              width: 70,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              controller.cartItems[listViewIndex].title,
                              softWrap: true,
                            ),
                            subtitle: Text(
                              '\$${controller.cartItems[listViewIndex].productVariants.first.price.amount}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Container(
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      GestureDetector(
                                        child: const Icon(
                                          CupertinoIcons.minus,
                                          size: 24,
                                          color: Colors.black,
                                        ),
                                        onTap: () {
                                          quantity--;
                                        },
                                      ),
                                      Text(
                                        quantity.toString(),
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      GestureDetector(
                                        child: const Icon(
                                          Icons.add,
                                          size: 24,
                                          color: Colors.black,
                                        ),
                                        onTap: () {
                                          quantity++;
                                          subtotal = controller.cartItems[listViewIndex].productVariants.first.price.amount * quantity;
                                        },
                                      ),
                                    ],
                                  ),
                                  Text('\$$subtotal',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
                },
              )*/
}
