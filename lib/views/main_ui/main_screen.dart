import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/cart_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/collections_list_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/home_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/product_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/products_list_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/wish_list_controller.dart';
import 'package:lime_light_copy_shopify_store/services/hex_color.dart';
import 'package:lime_light_copy_shopify_store/views/cart/cart_screen.dart';
import 'package:lime_light_copy_shopify_store/views/categories/collections_screen.dart';
import 'package:lime_light_copy_shopify_store/views/home_ui/home_screen.dart';
import 'package:lime_light_copy_shopify_store/views/search/search_screen.dart';
import 'package:lime_light_copy_shopify_store/views/settings/settings_screen.dart';

import 'bottom_tabs.dart';

class MainScreen extends StatefulWidget {
  int selectedIndex = 0;

  MainScreen({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {

  // For Google Nav Bar
  var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;

  // final homeController = Get.find<HomeController>();
  // final wishListController = Get.find<WishListController>();
  // final cartController = Get.find<CartController>();
  // final productController = Get.find<ProductController>();
  // final productListController = Get.find<ProductsListController>();
  // final collectionsListController = Get.find<CollectionsListController>();

  /*var iconList = <Widget>[
    const Icon(Icons.home_filled),
    const Icon(Icons.category_outlined),
    const Icon(Icons.search_outlined),
    Badge(
      label: GetX<CartController>(builder: (controller) {
        return Text(controller.itemsCount.toString());
      }),
      isLabelVisible: true,
      child: const Icon(CupertinoIcons.bag),
    ),
    const Icon(CupertinoIcons.settings),
  ];*/

  var pagesList = [
    HomeScreen(),
    const CategoryScreen(),
    const SearchScreen(),
    CartScreen(),
    const SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
      _bottomNavIndex = widget.selectedIndex;
      debugPrint("Selected Index of Screen from Bottom : $_bottomNavIndex");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onItemTapped(widget.selectedIndex);

    // final systemTheme = SystemUiOverlayStyle.light.copyWith(
    //   systemNavigationBarColor: HexColor('#373A36'),
    //   systemNavigationBarIconBrightness: Brightness.light,
    // );
    // SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    // _hideBottomBarAnimationController = AnimationController(
    //   duration: const Duration(milliseconds: 200),
    //   vsync: this,
    // );

    Future.delayed(
      const Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      const Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
  }

  var items = [
    TabNavigationItem(
      page: HomeScreen(),
      icon: const Icon(Icons.home),
      title: const Text("Home"),
    ),
    TabNavigationItem(
      page: const CategoryScreen(),
      icon: const Icon(Icons.category),
      title: const Text("Category"),
    ),
    TabNavigationItem(
      page: const SearchScreen(),
      icon: const Icon(CupertinoIcons.search),
      title: const Text("Search"),
    ),
    TabNavigationItem(
      page: CartScreen(),
      icon: badges.Badge(
        showBadge: true,
        position: badges.BadgePosition.topEnd(top: 0, end: 3),
        badgeAnimation: const badges.BadgeAnimation.rotation(
          animationDuration: Duration(seconds: 3),
          colorChangeAnimationDuration: Duration(seconds: 1),
          loopAnimation: false,
          curve: Curves.fastOutSlowIn,
          colorChangeAnimationCurve: Curves.easeInCubic,
        ),
        badgeStyle: badges.BadgeStyle(
          shape: badges.BadgeShape.square,
          badgeColor: Colors.blue,
          padding: const EdgeInsets.all(5),
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.white, width: 2),
          borderGradient: const badges.BadgeGradient.linear(
              colors: [Colors.red, Colors.black]),
          badgeGradient: const badges.BadgeGradient.linear(
            colors: [Colors.blue, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          elevation: 0,
        ),
        badgeContent: GetX<CartController>(builder: (controller) {
          return Text(controller.cartItems.length.toString());
        }),
        child: const Icon(CupertinoIcons.cart),
      ),
      title: const Text("Cart"),
    ),
    TabNavigationItem(
      page: const SettingScreen(),
      icon: const Icon(CupertinoIcons.settings),
      title: const Text("Settings"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: buildNavigationBar(),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {},
        //   icon: const Icon(CupertinoIcons.bag_fill),
        //   label: GetX<CartController>(builder: (controller) {
        //     return Text(
        //       controller.itemsCount.toString(),
        //       style: const TextStyle(color: Colors.black, fontSize: 24),
        //     );
        //   }),
        // ),
        body:
            // NotificationListener<ScrollNotification>(
            //   onNotification: onScrollNotification,
            //   child:
            //     IndexedStack(
            //   index: widget.selectedIndex,
            //   children: [
            //     for (final tabItem in items) tabItem.page,
            //   ],
            // ),
            pagesList[widget.selectedIndex]
        // ),
        );
  }

  buildNavigationBar() {
    return BottomNavigationBar(
      iconSize: 35,
      elevation: 0,
      showSelectedLabels: true,
      selectedItemColor: HexColor('#F47B68'),
      unselectedItemColor: HexColor('#687eaf'),
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.home,
          ),
          label: "Home",
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.collections,
          ),
          label: "Collections",
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.search,
          ),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Stack(children: <Widget>[
            const Icon(CupertinoIcons.bag),
            Positioned(
                top: -5.0,
                right: 1.0,
                child: Stack(
                  children: <Widget>[
                    badges.Badge(
                      badgeContent: GetX<CartController>(builder: (controller) {
                        return Text(
                          controller.cartItems.length.toString(),
                        );
                      }),
                      showBadge: true,
                      ignorePointer: true,
                      badgeStyle: badges.BadgeStyle(
                        shape: badges.BadgeShape.circle,
                        badgeColor: Colors.blue,
                        padding: const EdgeInsets.all(5),
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                        badgeGradient: const badges.BadgeGradient.linear(
                          colors: [Colors.blue, Colors.yellow],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        elevation: 0,
                      ),
                      badgeAnimation: const badges.BadgeAnimation.fade(
                        animationDuration: Duration(seconds: 3),
                        toAnimate: true,
                        // colorChangeAnimationDuration: Duration(seconds: 2),
                        disappearanceFadeAnimationDuration:
                            Duration(seconds: 1),
                        loopAnimation: true,
                        curve: Curves.elasticInOut,
                        // colorChangeAnimationCurve: Curves.easeInCubic,
                      ),
                    ),
                  ],
                ))
          ]),
          label: "Bag",
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.settings,
          ),
          label: "Settings",
        ),
      ],
      onTap: _onItemTapped,
      currentIndex: widget.selectedIndex,
    );
  }

/*AnimatedBottomNavigationBar buildAnimatedBottomNavBar() {
    return AnimatedBottomNavigationBar.builder(
      gapWidth: 2,
      itemCount: iconList.length,
      tabBuilder: (int index, bool isActive) {
        // final color = isActive ? HexColor('#F47B68') : HexColor('#687eaf');
        return Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: iconList[index],
        );
      },
      height: 70,
      backgroundColor: Colors.white,
      activeIndex: _bottomNavIndex,
      notchAndCornersAnimation: borderRadiusAnimation,
      splashSpeedInMilliseconds: 300,
      notchSmoothness: NotchSmoothness.defaultEdge,
      gapLocation: GapLocation.end,
      leftCornerRadius: 0,
      rightCornerRadius: 0,
      elevation: 0,
      onTap: _onItemTapped,
      // hideAnimationController: _hideBottomBarAnimationController,
    );
  }*/
}
