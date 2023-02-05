import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/wish_list_controller.dart';
import 'package:lime_light_copy_shopify_store/views/wish_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:flag/flag.dart';
import 'package:lime_light_copy_shopify_store/services/theme_manager.dart';
import 'package:lime_light_copy_shopify_store/views/main_ui/main_screen.dart';
import 'package:lime_light_copy_shopify_store/views/settings/currency_selection_screen.dart';
import 'package:lime_light_copy_shopify_store/views/settings/language_selection_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final wishListController = Get.find<WishListController>();

  var notificationSwitchIsEnabled = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  String currencyName = 'USD';
  var currencyIcon = FontAwesomeIcons.dollarSign;
  String languageName = 'English';
  var flagCode = FlagsCode.GB;

  _setCurrencyName() {
    setState(() {
      currencyName = CurrencySelectionScreen.selectedCurrency;
      currencyName = CurrencySelectionScreen.selectedCurrencyIcon;
    });
  }

  _setLanguageName() {
    setState(() {
      languageName = LanguageSelectionScreen.selectedLanguage;
      flagCode = LanguageSelectionScreen.selectedLanguageIcon;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Scaffold(
        key: scaffoldKey,
        drawer: buildDrawer(context),
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              leading: ElevatedButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, elevation: 0),
                  child: Image.asset(
                    "assets/images/blur.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.fitWidth,
                  )),
              expandedHeight: 180,
              floating: true,
              pinned: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              actionsIconTheme: const IconThemeData(opacity: 0.0),
              flexibleSpace: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/settings_galaxy.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Positioned(
                    bottom: 20,
                    left: 65,
                    child: Text(
                      'Settings',
                      style: TextStyle(color: Colors.white, fontSize: 38),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  // Login Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.person,
                                size: 26,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // general Settings Text
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'General Settings',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // WishList Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => WishListScreen());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.favorite_border,
                                size: 26,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'My Wishlist',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                wishListController.products.isNotEmpty
                                    ? wishListController.itemsCount == 1
                                        ? '${wishListController.itemsCount} Product'
                                        : '${wishListController.itemsCount} Products'
                                    : '',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: wishListController.products.isNotEmpty
                                      ? Colors.green
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Divider
                  const Padding(
                    padding: EdgeInsets.only(left: 80.0, right: 10),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  // notification Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.notifications_none_outlined,
                                size: 26,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'Get Notification',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Switch(
                            value: notificationSwitchIsEnabled,
                            onChanged: (value) {
                              setState(() {
                                debugPrint(
                                    "notification Switch Value : $value");
                                notificationSwitchIsEnabled = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  // used to hide any widget
                  Offstage(
                    offstage: !notificationSwitchIsEnabled,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 80.0, right: 10),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 5.0),
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      FontAwesomeIcons.bars,
                                      size: 26,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      'Notify Messages',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Divider
                  const Padding(
                    padding: EdgeInsets.only(left: 80.0, right: 10),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  // Languages Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context)
                        //     .push(
                        //       MaterialPageRoute(
                        //           builder: (_) =>
                        //               const LanguageSelectionScreen()),
                        //     )
                        //     .then((value) => _setLanguageName());
                        Get.to(LanguageSelectionScreen())!
                            .then((value) => _setLanguageName());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Flag.fromCode(
                                flagCode,
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              const Text(
                                'Languages',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                languageName,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Divider
                  const Padding(
                    padding: EdgeInsets.only(left: 80.0, right: 10),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  // Currency Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context)
                        //     .push(
                        //       MaterialPageRoute(
                        //           builder: (_) => CurrencySelectionScreen()),
                        //     )
                        //     .then((value) => _setCurrencyName());
                        Get.to(CurrencySelectionScreen())!
                            .then((value) => _setCurrencyName());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                currencyIcon,
                                size: 26,
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              const Text(
                                'Currencies',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                currencyName,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Divider
                  const Padding(
                    padding: EdgeInsets.only(left: 80.0, right: 10),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  /*// Appearance Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    child: InkWell(
                      onTap: () {
                        themeNotifier.isDark
                            ? themeNotifier.isDark = false
                            : themeNotifier.isDark = true;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.nights_stay,
                                size: 26,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "Dark Mode",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          Switch(value: themeNotifier.isDark, onChanged: (value){
                            setState(() {
                              themeNotifier.isDark
                                  ? themeNotifier.isDark = value
                                  : themeNotifier.isDark = value;
                            });
                          }),

                        ],
                      ),
                    ),
                  ),
                  // Divider
                  const Padding(
                    padding: EdgeInsets.only(left: 80.0, right: 10),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),*/
                  // Rating Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.star_border_outlined,
                                size: 26,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'Rate the app',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Divider
                  const Padding(
                    padding: EdgeInsets.only(left: 80.0, right: 10),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  // Privacy and Terms Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                FontAwesomeIcons.fileLines,
                                size: 26,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'Privacy and Terms',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Divider
                  const Padding(
                    padding: EdgeInsets.only(left: 80.0, right: 10),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  // About Us Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.report_gmailerrorred,
                                size: 26,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'About Us',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Divider
                  const Padding(
                    padding: EdgeInsets.only(left: 80.0, right: 10),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: const EdgeInsets.all(0),
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 30,
                child: Image(
                  image: AssetImage('assets/images/shopify.png'),
                  fit: BoxFit.fill,
                  width: 55,
                  height: 55,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Lime Light Store",
                style: TextStyle(fontSize: 22.0),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1.1,
          indent: 10,
          endIndent: 10,
        ),
        ListTile(
          leading: const Icon(CupertinoIcons.home),
          title: const Text(' Home '),
          onTap: () {
            Get.off(MainScreen(selectedIndex: 0));
          },
        ),
        ListTile(
          leading: const Icon(Icons.book),
          title: const Text(' Blog '),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          leading: const Icon(Icons.category_outlined),
          title: const Text(' Categories '),
          onTap: () {
            Get.off(MainScreen(selectedIndex: 1));
          },
        ),
        ListTile(
          leading: const Icon(CupertinoIcons.bag),
          title: const Text(' Cart '),
          onTap: () {
            Get.off(MainScreen(selectedIndex: 3));
          },
        ),
        ListTile(
          leading: const Icon(CupertinoIcons.settings),
          title: const Text(' Settings'),
          onTap: () {
            // Navigator.pop(context);
            Get.back();
          },
        ),
        ListTile(
          leading: const Icon(Icons.login),
          title: const Text('Login'),
          onTap: () {
            Get.back();
          },
        ),
      ],
    ));
  }
}
