

import 'package:flutter/material.dart';
import 'package:lime_light_copy_shopify_store/services/connectivity_service.dart';
import 'package:lime_light_copy_shopify_store/theme/app_style.dart';

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
                      const Icon(Icons.cloud_off),
                      const SizedBox(height: 25),
                      Text('No network connection.',style: AppStyle.txtPoppinsMedium20,),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          ConnectivityService.instance.checkConnection();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(150, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )
                        ),
                        child: Text('Try Again',style: AppStyle.txtPoppinsMedium20,),
                      ),
                    ],
                  ),
                ),
                )),
        );
    }
}
