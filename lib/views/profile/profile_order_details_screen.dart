import 'package:flutter/material.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/models.dart';

class ProfileOrderDetailsScreen extends StatelessWidget {
  final Order order;

  const ProfileOrderDetailsScreen({Key? key, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
