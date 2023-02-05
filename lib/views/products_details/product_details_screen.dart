import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lime_light_copy_shopify_store/controllers/cart_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/wish_list_controller.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/models.dart';
import 'package:lime_light_copy_shopify_store/views/main_ui/main_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with TickerProviderStateMixin {
  late Product product;
  List<String> variantsTitle = [];
  List<String> collectionsTitle = [];
  String onlineStoreUrl = '';

  bool _descriptionIconSelected = true;
  bool _optionIconSelected = true;
  bool _tagsIconSelected = true;
  bool _categoryIconSelected = true;
  late int _optionsLength;
  var selectedItem = '';

  final wishlistController = Get.find<WishListController>();
  final cartController = Get.find<CartController>();

  bool _favIconState = false;

  @override
  void initState() {
    // TODO: implement initState

    product = widget.product;
    debugPrint('Product Description **: ${product.description} '
        '**${product.description!.length.toString()}**:**');

    getProductVariantsTitle(product);
    getProductCollectionsTitle(product);
    _optionsLength = product.option.length;
    // onlineStoreUrl = product.onlineStoreUrl!;
    super.initState();
  }

  void getProductVariantsTitle(Product product) {
    for (var element in product.productVariants) {
      variantsTitle.add(element.title);
    }
  }

  void getProductCollectionsTitle(Product product) {
    if (product.collectionList!.isNotEmpty) {
      for (var element in product.collectionList!.reversed) {
        collectionsTitle.add(element.title);
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            cartController.addProduct(product);
            Fluttertoast.showToast(msg: "${product.title} added to bag.");
          },
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          label: const Text('Add to Bag',style: TextStyle(color: Colors.white),),
          icon: const Icon(CupertinoIcons.bag_badge_plus,color: Colors.white,),),
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            expandedHeight: 325,
            floating: true,
            pinned: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),),
            actions: [
              IconButton(
                onPressed: () {
                  if (wishlistController.products.contains(product)) {
                    wishlistController.removeProductFromWishList(product);
                    setState(() {
                      _favIconState = !_favIconState;
                    });
                    debugPrint('product already in wishlist');
                  } else {
                    wishlistController.addProductToWishList(product);
                    Fluttertoast.showToast(msg: '${product.title} added to wishlist.');
                    debugPrint('Wishlist Products length : ** ${wishlistController.itemsCount} **');
                    setState(() {
                      _favIconState = !_favIconState;
                    });
                  }
                },
                icon: Icon(
                  _favIconState
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: _favIconState
                      ? Colors.red
                      : Colors.grey,
                ),
              ),
              PopupMenuButton(
                onSelected: (value) {
                  // your logic
                  setState(() {
                    selectedItem = value.toString();
                  });
                  debugPrint(value);
                  // Navigator.pushNamed(context, value.toString());
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: const Text('My Cart'),
                      onTap: () {
                        Get.to(() => MainScreen(
                              selectedIndex: 3,
                            ));
                      },
                    ),
                    PopupMenuItem(
                      child: const Text('Save to Wishlist'),
                      onTap: () {
                        if (wishlistController.products.contains(product)) {
                          debugPrint('product already in wishlist');
                        } else {
                          wishlistController.addProductToWishList(product);
                        }
                      },
                    ),
                    PopupMenuItem(
                      child: const Text('Share'),
                      onTap: () {},
                    ),
                  ];
                },
              ),
            ],
            flexibleSpace: Container(
              child: ListView.builder(
                itemCount: product.images.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const PageScrollPhysics(),
                itemBuilder: (BuildContext context, int imageListIndex) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                        child:
                        Image(
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                          width: size.width,
                          height: 375,
                          image: NetworkImage(
                              product.images[imageListIndex].originalSrc),
                        ),

                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Text(
                          "${imageListIndex + 1}/${product.images.length}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1.2,
                  color: Colors.grey,
                  indent: 40,
                  endIndent: 40,
                ),
                // Title Widget
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Price Widget
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.productVariants[0].price.formattedPrice,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                // Description Widget
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _descriptionIconSelected = !_descriptionIconSelected;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: size.width - 20,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(_descriptionIconSelected
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Offstage(
                  offstage: !_descriptionIconSelected,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 2),
                    child: SizedBox(
                      width: size.width - 30,
                      height: 110,
                      child: Text(
                        '${product.description}',
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),

                // Additional Information Widget
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _optionIconSelected = !_optionIconSelected;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: size.width - 20,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Additional Information',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(_optionIconSelected
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Offstage(
                  offstage: !_optionIconSelected,
                  child: SizedBox(
                    width: size.width - 30,
                    height: _optionsLength > 1 ? 80 : 50,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: product.option.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, int optionsListViewIndex) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                product.option[optionsListViewIndex].name,
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                product.option[optionsListViewIndex].values
                                    .join(','),
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                // Categories Widget
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _categoryIconSelected = !_categoryIconSelected;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: size.width - 20,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Categories',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(_categoryIconSelected
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Offstage(
                  offstage: !_categoryIconSelected,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 2),
                    child: SizedBox(
                      width: size.width - 30,
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: product.collectionList?.length ?? 0,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, int collectionListViewIndex) {
                          return TextButton(
                            onPressed: () {},
                            child: Text(
                              product.collectionList![collectionListViewIndex]
                                  .title
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                // Product Tags Widget
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _tagsIconSelected = !_tagsIconSelected;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: size.width - 20,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Product Tags',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(_tagsIconSelected
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Offstage(
                  offstage: !_tagsIconSelected,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 2),
                    child: SizedBox(
                      width: size.width - 30,
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: product.tags.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, int tagsListViewIndex) {
                          return TextButton(
                            onPressed: () {},
                            child: Text(
                              product.tags[tagsListViewIndex].toString(),
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // Random space at bottom
                const SizedBox(
                  height: 300,
                ),
              ],
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Text(product.productVariants[0].price.formattedPrice),
          // ),
        ],
      ),
    );
  }
}
