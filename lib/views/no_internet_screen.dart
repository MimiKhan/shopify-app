

import 'package:flutter/material.dart';
import 'package:lime_light_copy_shopify_store/services/connectivity_service.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          ConnectivityService.instance.checkConnection();
          return true;
        },
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 25),
                      const Text('no internet detected.'),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          ConnectivityService.instance.checkConnection();
                        },
                        child: const Text('reload'),
                      ),
                    ],
                  ),
                ),
                )),
        );
    }
}
