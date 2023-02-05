import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/cart_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/home_controller.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/models.dart';
import 'package:lime_light_copy_shopify_store/views/categories/collections_details_screen.dart';
import 'package:lime_light_copy_shopify_store/views/products_details/all_products_screen.dart';
import 'package:lime_light_copy_shopify_store/views/products_details/product_details_screen.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  final homeController = Get.find<HomeController>();
  final cartController = Get.find<CartController>();

  void _navigateToProductDetailScreen(Product product) {
    Fluttertoast.showToast(msg: 'Routing to ${product.title}');
    Get.to(() => ProductDetailScreen(product: product));
  }

  void _navigateToAllProductsScreen() {
    Fluttertoast.showToast(msg: 'Routing to All Products');
    Get.to(() => const AllProducts());
  }

  void _navigateToCollectionDetailScreen(
      String collectionId, String collectionTitle) {
    Get.to(() => CollectionDetailScreen(
        collectionId: collectionId, collectionTitle: collectionTitle));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 320,
              child: GetX<HomeController>(builder: (controller) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    // Image.network(controller.collections[0].image!.originalSrc,
                    //     fit: BoxFit.cover),
                    // ClipRRect(
                    //   // Clip it cleanly.
                    //   child: BackdropFilter(
                    //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    //     child: Container(
                    //       color: Colors.grey.withOpacity(0),
                    //       alignment: Alignment.center,
                    //     ),
                    //   ),
                    // ),

                    const Positioned(
                      top: 60,
                      left: 35,
                      child: Text(
                        "New Collection",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.blueGrey,
                        ),
                      ),
                      //     .animate(
                      //   effects: [
                      //     const ShimmerEffect(
                      //         color: Colors.white,
                      //         delay: Duration(milliseconds: 100),
                      //         duration: Duration(seconds: 2)),
                      //   ],
                      //   onComplete: (controller) {
                      //     controller.repeat();
                      //   },
                      // ),
                    ),

                    controller.collectionsCount == 0
                        ? const Center(
                            child: CupertinoActivityIndicator(
                              radius: 14,
                            ),
                          )
                        : Positioned(
                            bottom: 7,
                            left: size.width / 10.5,
                            right: size.width / 10.5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: GestureDetector(
                                onTap: () {
                                  _navigateToCollectionDetailScreen(
                                      controller.collections[0].id,
                                      controller.collections[0].title);
                                },
                                child: SizedBox(
                                  width: size.width * 0.9,
                                  height: 180,
                                  child: Image(
                                    image: NetworkImage(controller
                                        .collections[0].image!.originalSrc),
                                    fit: BoxFit.cover,
                                    width: 270,
                                    height: 180,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ],
                );
              }),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Trending',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          _navigateToAllProductsScreen();
                        },
                        child: const Text(
                          'See All',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Colors.cyan),
                        ),
                      ),
                    ],
                  ),
                ),
                GetX<HomeController>(builder: (controller) {
                  return controller.collectionsCount == 0
                      ? const Center(
                          child: CupertinoActivityIndicator(
                            radius: 14,
                          ),
                        )
                      : ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  // childAspectRatio: 1,
                                  crossAxisSpacing: 11,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: 400,
                                ),
                                itemCount:
                                    controller.bestSellingProducts.length,
                                itemBuilder:
                                    (BuildContext context, int gridViewIndex) {
                                  var quantityAvailable = controller
                                      .bestSellingProducts[gridViewIndex]
                                      .productVariants[0]
                                      .quantityAvailable;
                                  return GestureDetector(
                                    onTap: () {
                                      debugPrint(
                                          "GridView Index : $gridViewIndex");
                                      _navigateToProductDetailScreen(controller
                                          .bestSellingProducts[gridViewIndex]);
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 400,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        // border: Border.all(width: 0.7, color: Colors.grey),
                                        shape: BoxShape.rectangle,
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15)),
                                            child: SizedBox(
                                              height: 245,
                                              width: 195,
                                              child: Image(
                                                image: NetworkImage(controller
                                                    .bestSellingProducts[
                                                        gridViewIndex]
                                                    .images[0]
                                                    .originalSrc),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0, vertical: 5),
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  controller
                                                      .bestSellingProducts[
                                                          gridViewIndex]
                                                      .title,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                  softWrap: true,
                                                )),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    controller
                                                        .bestSellingProducts[
                                                            gridViewIndex]
                                                        .productVariants[0]
                                                        .price
                                                        .formattedPrice,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    controller
                                                                .bestSellingProducts[
                                                                    gridViewIndex]
                                                                .productVariants[
                                                                    0]
                                                                .quantityAvailable >
                                                            0
                                                        ? quantityAvailable < 10
                                                            ? 'Only $quantityAvailable available'
                                                            : 'In Stock'
                                                        : 'Out of Stock',
                                                    style: TextStyle(
                                                      color: controller
                                                                  .bestSellingProducts[
                                                                      gridViewIndex]
                                                                  .productVariants[
                                                                      0]
                                                                  .quantityAvailable >
                                                              0
                                                          ? Colors.green
                                                          : Colors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              if (quantityAvailable == 0) {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'No quantity available for ${controller.bestSellingProducts[gridViewIndex].title}.');
                                              } else {
                                                cartController.addProduct(
                                                    controller
                                                            .bestSellingProducts[
                                                        gridViewIndex]);
                                                debugPrint(
                                                    "Bag Items Count : ${cartController.cartItems.length}");
                                              }
                                            },
                                            icon: const Icon(
                                                CupertinoIcons.bag_badge_plus),
                                            iconSize: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                })
                          ],
                        );
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
