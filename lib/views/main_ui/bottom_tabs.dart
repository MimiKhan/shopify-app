import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lime_light_copy_shopify_store/views/cart/cart_ui/cart_screen.dart';
import 'package:lime_light_copy_shopify_store/views/categories/collections_screen.dart';
import 'package:lime_light_copy_shopify_store/views/home_ui/home_screen.dart';
import 'package:lime_light_copy_shopify_store/views/search/search_screen.dart';
import 'package:lime_light_copy_shopify_store/views/settings/settings_screen.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Widget icon;

  TabNavigationItem(
      {required this.page, required this.title, required this.icon});
/*
  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: HomeScreen(),
          icon: Icon(Icons.home),
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
          page: const CartScreen(),
          icon: const Icon(CupertinoIcons.bag),
          title: const Text("Cart"),
        ),
        TabNavigationItem(
          page: const SettingScreen(),
          icon: const Icon(CupertinoIcons.settings),
          title: const Text("Settings"),
        ),
      ];*/
}
