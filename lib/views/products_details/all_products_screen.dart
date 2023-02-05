import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/products_list_controller.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/product/product.dart';
import 'package:lime_light_copy_shopify_store/views/products_details/product_details_screen.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts>
    with TickerProviderStateMixin {
  // this variable determines whether the back-to-top button is shown or not
  bool _showBackToTopButton = false;

  // scroll controller
  late ScrollController _scrollController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
    debugPrint('Routing to ${product.title}');
    // Fluttertoast.showToast(msg: 'Routing to ${product.title}');
    Get.to(() => ProductDetailScreen(product: product));
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
        child: GetX<ProductsListController>(
          builder: (controller) {
            return controller.productsCount == 0?
            const Center(child:CupertinoActivityIndicator(radius: 14,color: Colors.white,),)
                :ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /*Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'All Products',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),*/
                    const SizedBox(
                      height: 15,
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
                                  itemCount: controller.productsList.length,
                                  itemBuilder:
                                      (BuildContext context, int gridViewIndex) {
                                    var quantityAvailable = controller.productsList[gridViewIndex]
                                        .productVariants[0]
                                        .quantityAvailable;
                                    return GestureDetector(
                                      onTap: () {
                                        debugPrint(
                                            "GridView Index : $gridViewIndex");
                                        setState(() {
                                          _navigateToProductDetailScreen(
                                              controller.productsList[gridViewIndex]);
                                        });
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
                                              borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight: Radius.circular(15)),
                                              child: SizedBox(
                                                height: 245,
                                                width: 195,
                                                child: Image(
                                                  image: NetworkImage(
                                                      controller.productsList[gridViewIndex]
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
                                                    controller.productsList[gridViewIndex].title,
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
                                                      controller.productsList[gridViewIndex]
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
                                                      controller.productsList[gridViewIndex]
                                                                  .productVariants[
                                                                      0]
                                                                  .quantityAvailable >
                                                              0
                                                          ? quantityAvailable < 10
                                                              ? 'Only $quantityAvailable available'
                                                              : 'In Stock'
                                                          : 'Out of Stock',
                                                      style: TextStyle(
                                                        color: controller.productsList[gridViewIndex]
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
                                              onPressed: () {},
                                              icon: const Icon(
                                                  Icons.add_shopping_cart_outlined),
                                              iconSize: 30,
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
          }
        ),
      ),
    );
  }
}
