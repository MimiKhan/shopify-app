import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/services/configs.dart';
import 'package:lime_light_copy_shopify_store/services/connection_singleton.dart';
import 'package:lime_light_copy_shopify_store/services/init_configs.dart';
import 'package:lime_light_copy_shopify_store/services/theme_manager.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/shopify_config.dart';
import 'package:lime_light_copy_shopify_store/views/cart/cart_screen.dart';
import 'package:lime_light_copy_shopify_store/views/categories/collections_screen.dart';
import 'package:lime_light_copy_shopify_store/views/home_ui/home_screen.dart';
import 'package:lime_light_copy_shopify_store/views/main_ui/main_screen.dart';
import 'package:lime_light_copy_shopify_store/views/search/search_screen.dart';
import 'package:lime_light_copy_shopify_store/views/settings/settings_screen.dart';
import 'package:lime_light_copy_shopify_store/views/splash_screen.dart';
import 'package:provider/provider.dart';

enum Version {
  lazy,
  wait
}
// Cmd-line args/Env vars: https://stackoverflow.com/a/64686348/2301224
const String version = String.fromEnvironment('VERSION');
const Version running = version == "lazy" ? Version.lazy : Version.wait;


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  GlobalConfigs.initConfigs();
  // if (running == Version.lazy) {
  //   debugPrint('running LAZY version');
  //   LazyBindings().dependencies();
  // }
  //
  // if (running == Version.wait) {
  //   debugPrint('running AWAIT version');
  //   await AwaitBindings().dependencies(); // await is key here
  // }

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));

  ConnectionStatusSingleton connectionStatus =
  ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  if(connectionStatus.hasConnection){
    debugPrint("App has active internet connection.");
  }else{
    debugPrint("App is not connected to internet.");
  }

  ShopifyConfig.setConfig(CustomConfig.shopifyStoreFrontAPIAccessToken,
      CustomConfig.shopifyStoreLink, CustomConfig.shopifyApiVersion);

  runApp(const MyApp());

}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isOffline = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
          builder: (context, ModelTheme themeNotifier, child) {
            return GetMaterialApp(
              title: 'Shopify Store App',
              theme: themeNotifier.isDark
                  ? ThemeData(
                brightness: Brightness.dark,
                primaryColor: Colors.white,
                textTheme: Theme
                    .of(context)
                    .textTheme
                    .apply(
                  // fontFamily: GoogleFonts.montserrat().fontFamily,
                  bodyColor: Colors.white, //<-- SEE HERE
                  displayColor: Colors.white, //<-- SEE HERE
                ),
              )
                  : ThemeData(
                useMaterial3: true,
                brightness: Brightness.light,
                primaryColor: Colors.black,
                primarySwatch: Colors.deepPurple,
                textTheme: Theme
                    .of(context)
                    .textTheme
                    .apply(
                  // fontFamily: GoogleFonts.montserrat().fontFamily,
                  bodyColor: Colors.black, //<-- SEE HERE
                  displayColor: Colors.black, //<-- SEE HERE
                ),
              ),
              debugShowCheckedModeBanner: false,
              getPages: pagesList,
              initialRoute: '/splashScreen',
            );
          }),
    );
  }

  var pagesList = [
    GetPage(
        name: '/mainScreen',
        page: () =>
            MainScreen(
              selectedIndex: 0,
            )),
    GetPage(name: '/homeScreen', page: () => HomeScreen()),
    GetPage(name: '/splashScreen', page: () => SplashScreen()),
    GetPage(name: '/categoryScreen', page: () => const CategoryScreen()),
    GetPage(name: '/searchScreen', page: () => const SearchScreen()),
    GetPage(name: '/cartScreen', page: () => CartScreen()),
    GetPage(name: '/settings', page: () => const SettingScreen()),
    // GetPage(name: '/productDetailsScreen', page: () => const ProductDetailScreen(productID: "7356346499269")),
  ];
}

