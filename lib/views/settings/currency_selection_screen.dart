import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lime_light_copy_shopify_store/controllers/settings_controller.dart';

class CurrencySelectionScreen extends StatelessWidget {
  CurrencySelectionScreen({Key? key}) : super(key: key);

  final settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetX<SettingsController>(
          builder: (controller) {
            return Text(controller.selectedCurrency.value);
          }
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  buildListTile(context,
                      title: 'USD',
                      subtitle: 'US Dollar',
                      iconData: FontAwesomeIcons.dollarSign,
                  ),
                  buildListTile(context,
                      title: 'EUR',
                      subtitle: 'Euro',
                      iconData: FontAwesomeIcons.euroSign),
                  buildListTile(context,
                      title: 'GBP',
                      subtitle: 'Pound Sterling',
                      iconData: FontAwesomeIcons.sterlingSign),
                  buildListTile(context,
                      title: 'CAD',
                      subtitle: 'Canadian Dollar',
                      iconData: FontAwesomeIcons.canadianMapleLeaf),
                  buildListTile(context,
                      title: 'PKR',
                      subtitle: 'Pakistani Rupee',
                      iconData: FontAwesomeIcons.rupeeSign),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData iconData,
  }) {
    return ListTile(
      style: ListTileStyle.list,
      title: Text(title, style: const TextStyle(fontSize: 24)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 16)),
      leading: Icon(
        iconData,
        size: 25,
        color: Colors.black,
      ),
      onTap: () {
        settingsController.selectedCurrency.value = title;
        settingsController.selectedCurrencyIcon.value = iconData;
        // CurrencySelectionScreen.selectedCurrency = title;
        // CurrencySelectionScreen.selectedCurrencyIcon = iconData;
        Navigator.pop(context);
      },
    );
  }
}
