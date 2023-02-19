import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/cart_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/home_controller.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/models.dart';
import 'package:lime_light_copy_shopify_store/views/categories/collections_details_screen.dart';
import 'package:lime_light_copy_shopify_store/views/products_details/all_products_screen.dart';
import 'package:lime_light_copy_shopify_store/views/cart/new_add_to_cart_screen.dart';
import 'package:lime_light_copy_shopify_store/views/products_details/product_details_screen.dart';
import 'package:lime_light_copy_shopify_store/widgets/exit_popup.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.find<HomeController>();

  final cartController = Get.find<CartController>();

  void _navigateToProductDetailScreen(Product product) {
    Fluttertoast.showToast(msg: 'Routing to ${product.title}');
    debugPrint("${product.id}");
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
  bool _shimmerUpperEnable = true;
  bool _shimmerLowerEnable = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    waitForShimmerEffect();
  }

  Future<void> waitForShimmerEffect() async {
    await Future.delayed(const Duration(seconds: 2),() {
      setState(() {
        _shimmerUpperEnable = false;
        _shimmerLowerEnable = false;
      });
    },);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                _shimmerUpperEnable ?
                SizedBox(
                  height: 320,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        top: 60,
                        left: 35,
                        child: Shimmer.fromColors(
                          enabled: _shimmerUpperEnable,baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(width: 150,height: 20,color: Colors.white,),),
                      ),
                      Positioned(
                        bottom: 7,
                        left: size.width / 10.5,
                        right: size.width / 10.5,
                        child: Shimmer.fromColors(
                          enabled: _shimmerUpperEnable,
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,

                          child: Container(
                            width: size.width * 0.9,
                            height: 180,
                            color: Colors.white,

                          ),
                        ),
                      ),
                    ],
                  ),
                ):
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
                                      child:
                                      // Image(
                                      //   image: NetworkImage(controller
                                      //       .collections[0].image!.originalSrc),
                                      //   fit: BoxFit.cover,
                                      //   width: 270,
                                      //   height: 180,
                                      // ),
                                      CachedNetworkImage(
                                        imageUrl: controller.collections[0].image?.originalSrc ?? '',
                                        placeholder: (context, url) => Image.asset(
                                            'assets/images/lime-light-logo.png',
                                            fit: BoxFit.cover),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                        fit: BoxFit.contain,
                                        height: 180,
                                        width: 270,
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
                _shimmerLowerEnable ?
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
                          Shimmer.fromColors(
                            enabled: _shimmerLowerEnable,
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(width: 120,height: 15,color: Colors.white,),),
                          Shimmer.fromColors(
                            enabled: _shimmerLowerEnable,baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(width: 80,height: 15,color: Colors.white,),),
                        ],
                      ),
                    ),
                    ListView(
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
                              itemCount: 4,
                              itemBuilder:
                                  (BuildContext context, int gridViewIndex) {
                                // var quantityAvailable = controller
                                //     .bestSellingProducts[gridViewIndex]
                                //     .productVariants[0]
                                //     .quantityAvailable!;
                                return Container(
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
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                        const BorderRadius.only(
                                            topLeft:
                                            Radius.circular(15),
                                            topRight:
                                            Radius.circular(15)),
                                        child: Shimmer.fromColors(
                                          enabled: _shimmerLowerEnable,
                                          baseColor: Colors.grey.shade300,
                                          highlightColor: Colors.grey.shade100,
                                          child: Container(
                                            width: 175,
                                            height: 200,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0, vertical: 5),
                                        child: Shimmer.fromColors(
                                          enabled: _shimmerLowerEnable,
                                          baseColor: Colors.grey.shade300,
                                          highlightColor: Colors.grey.shade100,
                                          child: Container(
                                            width: 180,
                                            height: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Shimmer.fromColors(
                                        enabled: _shimmerLowerEnable,
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        child: Container(
                                          width: 120,
                                          height: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })
                        ]),
                  ],
                ):
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
                                      // var quantityAvailable = controller
                                      //     .bestSellingProducts[gridViewIndex]
                                      //     .productVariants[0]
                                      //     .quantityAvailable!;
                                      return GestureDetector(
                                        onTap: () {
                                          debugPrint(
                                              "GridView Index : $gridViewIndex");
                                          debugPrint(
                                              "Product ID : ${controller.bestSellingProducts[gridViewIndex].id}");
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
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                                  child:
                                                  // Image(
                                                  //   image: NetworkImage(controller
                                                  //       .bestSellingProducts[
                                                  //           gridViewIndex]
                                                  //       .images[0]
                                                  //       .originalSrc),
                                                  //   fit: BoxFit.fill,
                                                  // ),
                                                  CachedNetworkImage(
                                                    imageUrl: controller.bestSellingProducts[gridViewIndex].images[0].originalSrc,
                                                    placeholder: (context, url) => Image.asset(
                                                        'assets/images/lime-light-logo.png',
                                                        fit: BoxFit.cover),
                                                    errorWidget: (context, url, error) => const Icon(Icons.error),
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
                                              Align(
                                                alignment: Alignment.bottomCenter,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
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
                                                  ],
                                                ),
                                              ),
                                              // Quantity Text
                                              /*Text(
                                                controller
                                                    .bestSellingProducts[
                                                gridViewIndex]
                                                    .productVariants[
                                                0]
                                                    .quantityAvailable! >
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
                                                      .quantityAvailable! >
                                                      0
                                                      ? Colors.green
                                                      : Colors.red,
                                                ),
                                              ),


                                              Add to Cart Icon Button*/
                                              /*IconButton(
                                                onPressed: () {
                                                  if (quantityAvailable == 0) {
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            'No quantity available for ${controller.bestSellingProducts[gridViewIndex].title}.');
                                                  } else {
                                                    Get.to(()=> AddToCartScreen(product: controller.bestSellingProducts[gridViewIndex]));
                                                    debugPrint(
                                                        "Bag Items Count : ${cartController.cartModelItemsCount}");
                                                  }
                                                },
                                                icon: const Icon(
                                                    CupertinoIcons.bag_badge_plus),
                                                iconSize: 30,
                                              ),*/
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
        ),
      ),
    );
  }
}
