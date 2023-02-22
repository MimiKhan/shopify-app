import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/cart_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/products_list_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/wish_list_controller.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/product/product.dart';
import 'package:lime_light_copy_shopify_store/views/cart/new_add_to_cart_screen.dart';
import 'package:lime_light_copy_shopify_store/views/products_details/product_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts>
    with TickerProviderStateMixin {
  // this variable determines whether the back-to-top button is shown or not
  bool _showBackToTopButton = false;
  bool _shimmerEnable = true;


  // scroll controller
  late ScrollController _scrollController;

  final productListController = Get.find<ProductsListController>();
  final cartController = Get.find<CartController>();
  final wishListController = Get.find<WishListController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    waitForShimmerEffect();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 50) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }

  Future<void> waitForShimmerEffect() async {
    await Future.delayed(const Duration(seconds: 2),() {
      setState(() {
        _shimmerEnable = false;
      });
    },);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  void _navigateToProductDetailScreen(Product product) {
    debugPrint('Routing to ${product.id}');
    // Fluttertoast.showToast(msg: 'Routing to ${product.title}');
    Get.to(() => NewAddToCartScreen(product: product));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          'All Products',
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton.extended(
              onPressed: _scrollToTop,
              label: const Text("Return to top"),
              icon: const Icon(Icons.arrow_upward),
            ),
      body: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: GetX<ProductsListController>(builder: (controller) {
          return
            // controller.productsCount == 0
            //   ? const Center(
            //       child: CupertinoActivityIndicator(
            //         radius: 14,
            //         color: Colors.white,
            //       ),
            //     )
            //   :
          ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    _shimmerEnable ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            // Text(
                            //     'Total Products : ${controller.productsCount.toString()}'),
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
                                  mainAxisExtent: 420,
                                ),
                                itemCount: controller.productsList.length,
                                itemBuilder:
                                    (BuildContext context, int gridViewIndex) {
                                  return GestureDetector(
                                    onTap: () {
                                      debugPrint(
                                          "GridView Index : $gridViewIndex");
                                      setState(() {
                                        _navigateToProductDetailScreen(
                                            controller
                                                .productsList[gridViewIndex]);
                                      });
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 420,
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
                                              child: Shimmer.fromColors(
                                                enabled: _shimmerEnable,baseColor: Colors.grey.shade300,
                                                highlightColor: Colors.grey.shade100,
                                                child: Container(width: 195,height: 245,color: Colors.white,),),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Shimmer.fromColors(
                                                    enabled: _shimmerEnable,baseColor: Colors.grey.shade300,
                                                    highlightColor: Colors.grey.shade100,
                                                    child: Container(width: 100,height: 40,color: Colors.white,),),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0, vertical: 10),
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Shimmer.fromColors(
                                                  enabled: _shimmerEnable,baseColor: Colors.grey.shade300,
                                                  highlightColor: Colors.grey.shade100,
                                                  child: Container(width: 160,height: 20,color: Colors.white,),),),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                })
                          ],
                        ),
                      ],
                    )
                    :Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            // Text(
                            //     'Total Products : ${controller.productsCount.toString()}'),
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
                                  mainAxisExtent: 420,
                                ),
                                itemCount: controller.productsList.length,
                                itemBuilder:
                                    (BuildContext context, int gridViewIndex) {
                                  return GestureDetector(
                                    onTap: () {
                                      debugPrint(
                                          "GridView Index : $gridViewIndex");
                                      setState(() {
                                        _navigateToProductDetailScreen(
                                            controller
                                                .productsList[gridViewIndex]);
                                      });
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 420,
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
                                              child: CachedNetworkImage(
                                                imageUrl: controller
                                                    .productsList[gridViewIndex]
                                                    .images.first.originalSrc,
                                                placeholder: (context, url) =>
                                                    Image.asset(
                                                        'assets/images/lime-light-logo.png',
                                                        fit: BoxFit.cover),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    controller
                                                        .productsList[
                                                            gridViewIndex]
                                                        .productVariants[0]
                                                        .price
                                                        .formattedPrice,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0, vertical: 10),
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  controller
                                                      .productsList[
                                                          gridViewIndex]
                                                      .title,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                  softWrap: true,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                })
                          ],
                        ),
                      ],
                    )
                  ],
                );
        }),
      ),
    );
  }
}
