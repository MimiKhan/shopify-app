

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/cart_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/wish_list_controller.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/product/product.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:lime_light_copy_shopify_store/theme/app_style.dart';
import 'package:lime_light_copy_shopify_store/views/main_ui/main_screen.dart';
import 'package:lime_light_copy_shopify_store/views/products_details/custom_image_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewProductDetailsScreen extends StatefulWidget {
  final Product product;
  const NewProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<NewProductDetailsScreen> createState() => _NewProductDetailsScreenState();
}

class _NewProductDetailsScreenState extends State<NewProductDetailsScreen> {

  late Product product;
  List<String> variantsTitle = [];
  List<String> collectionsTitle = [];
  String onlineStoreUrl = '';

  String selectedItem = '';

  final wishlistController = Get.find<WishListController>();
  final cartController = Get.find<CartController>();

  late bool _favIconState;

  String markdown = '';

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    debugPrint('Product Description **: ${product.description} '
        '**${product.description!.length.toString()}**:**');

    getProductVariantsTitle(product);
    getProductCollectionsTitle(product);
    String? html = product.descriptionHtml;
    markdown = html2md.convert(html!);
    // onlineStoreUrl = product.onlineStoreUrl!;
    _favIconState = wishlistController.favouritesList.contains(product);
    debugPrint("Fav Icon State : $_favIconState");
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
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // set the color of the back icon here
        ),
        title: Text('${product.collectionList?.first.title}',style: const TextStyle(color: Colors.white,fontSize: 14),),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            key: UniqueKey(),
            onPressed: () {
              setState(() {
                wishlistController.toggleFavorites(product);
              });
              debugPrint("Length of Fav List : ${wishlistController.favouritesList.length}");
            },
            icon: Icon(
              _favIconState
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
              color: _favIconState ? Colors.red : null,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => MainScreen(selectedIndex: 3));
            },
            icon: const Icon(
              CupertinoIcons.bag,
            ),
          ),
          IconButton(
            onPressed: () {
            },
            icon: const Icon(
              CupertinoIcons.share,
            ),
          ),
        ],

      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            GestureDetector(
              onTap:(){
                Get.to(() => CustomImageViewer(product: product));
              },
              child: SizedBox(
                width: size.width,
                height: 375,
                child:
                  PageView.builder(
                    controller: _pageController,
                    itemCount: widget.product.images.length,
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                        imageUrl: product.images[index].originalSrc,
                        placeholder: (context, url) => Image.asset(
                            'assets/images/lime-light-logo.png',
                            fit: BoxFit.cover),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                        fit: BoxFit.contain,
                        height: 375,
                        width: size.width,
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                  ),
              ),
            ),

            SmoothPageIndicator(
              controller: _pageController,
              count: widget.product.images.length,
              axisDirection: Axis.horizontal,
              onDotClicked: (index){
                _pageController.jumpToPage(index);
              },
              effect: const WormEffect(
                dotWidth: 12.0,
                dotHeight: 12.0,
                activeDotColor: Colors.black,
                spacing: 10,
              ),
            ),
            const Divider(
              indent: 40,
              endIndent: 40,
              color: Colors.black,
              thickness: 2,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Title',style: TextStyle(fontSize:24,fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(product.title,style: AppStyle.txtPoppinsMedium20,),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Product Details',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MarkdownBody(
                data: markdown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
