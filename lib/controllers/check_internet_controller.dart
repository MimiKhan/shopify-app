import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

// With only connectivity_plus
/*class InternetCheckController extends GetxController {
  final _connectivityResult = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _checkConnectivity();
  }

  void _checkConnectivity() async {
    _connectivityResult.value = await Connectivity().checkConnectivity();
  }

  Widget getErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('No internet connection.'),
          ElevatedButton(
            onPressed: () async {
              var result = await Connectivity().checkConnectivity();
              if (result != ConnectivityResult.none) {
                _checkConnectivity();
              }
            },
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }

  bool get isOnline {
    return _connectivityResult.value != ConnectivityResult.none;
  }
}*/

class InternetCheckController extends GetxController {
  var _isConnected = false.obs;
  var _connectivityResult = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _checkConnectivity();
  }

  void _checkConnectivity() async {
    _isConnected.value = await InternetConnectionChecker().hasConnection;
    _connectivityResult.value = await Connectivity().checkConnectivity();
  }

  Widget getErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('No internet connection.'),
          ElevatedButton(
            onPressed: () async {
              var result = await InternetConnectionChecker().hasConnection;
              if (result) {
                _checkConnectivity();
              }
            },
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }

  bool get isOnline {
    return _isConnected.value || _connectivityResult.value != ConnectivityResult.none;
  }
}

