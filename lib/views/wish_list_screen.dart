import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/wish_list_controller.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({Key? key}) : super(key: key);

  final wishListController = Get.find<WishListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WishList'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(
            Icons.close_outlined,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      // icon: const Icon(CupertinoIcons.question_circle),
                      backgroundColor: Colors.blueGrey,
                      iconColor: Colors.white,
                      // title: const Text('Help',style: TextStyle(color: Colors.white),),
                      content: const Text(
                        'Slide to remove from WishList',
                        softWrap: true,
                        style: TextStyle(color: Colors.white),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple),
                            child: const Text(
                              "OK",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                CupertinoIcons.question_circle,
                color: Colors.white,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            if (wishListController.products.isNotEmpty)
              GetX<WishListController>(
                builder: (controller) => ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(10),
                  children: controller.products.map((product) {
                    return Dismissible(
                      background: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(CupertinoIcons.delete),
                        ),
                      ),
                      key: ValueKey(product),
                      onDismissed: (DismissDirection direction) {
                        controller.removeProductFromWishList(product);
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
                                  'Do you really want to remove \n"${product.title}"\n from the cart?'),
                              actions: <Widget>[
                                // ElevatedButton(
                                //     onPressed: () =>
                                //         Navigator.of(context).pop(true),
                                //     child: const Text("Confirm")),
                                OutlinedButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text("Confirm"),
                                ),
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
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            leading: Image.network(
                              product.images[0].originalSrc,
                              width: 80,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              product.title,
                            ),
                            subtitle: Text(
                              '\$${product.productVariants.first.price.amount}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
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
}
