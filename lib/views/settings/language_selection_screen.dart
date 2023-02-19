import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/settings_controller.dart';

class LanguageSelectionScreen extends StatelessWidget {

  LanguageSelectionScreen({Key? key}) : super(key: key);

  final settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetX<SettingsController>(
          builder: (controller) {
            return Text(controller.selectedLanguage.value);
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
                  Column(
                    children: [
                      buildListTile(context,
                          title: 'English', flagCode: FlagsCode.GB),
                      const Divider(
                        indent: 75,
                        endIndent: 10,
                        thickness: 1.1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      buildListTile(context,
                          title: 'French', flagCode: FlagsCode.FR),
                      const Divider(
                        indent: 75,
                        endIndent: 10,
                        thickness: 1.1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      buildListTile(context,
                          title: 'Hindi', flagCode: FlagsCode.IN),
                      const Divider(
                        indent: 75,
                        endIndent: 10,
                        thickness: 1.1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      buildListTile(context,
                          title: 'Spanish', flagCode: FlagsCode.ES),
                      const Divider(
                        indent: 75,
                        endIndent: 10,
                        thickness: 1.1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      buildListTile(context,
                          title: 'Arabic', flagCode: FlagsCode.AE),
                      const Divider(
                        indent: 75,
                        endIndent: 10,
                        thickness: 1.1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      buildListTile(context,
                          title: 'Russian', flagCode: FlagsCode.RU),
                      const Divider(
                        indent: 75,
                        endIndent: 10,
                        thickness: 1.1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      buildListTile(context,
                          title: 'Japanese', flagCode: FlagsCode.JP),
                      const Divider(
                        indent: 75,
                        endIndent: 10,
                        thickness: 1.1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      buildListTile(context,
                          title: 'Turkish', flagCode: FlagsCode.TR),
                      const Divider(
                        indent: 75,
                        endIndent: 10,
                        thickness: 1.1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
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
    required FlagsCode flagCode,
  }) {
    return ListTile(
      style: ListTileStyle.list,
      title: Row(
        children: [
          const SizedBox(width: 20,),
          Text(title, style: const TextStyle(fontSize: 24)),
        ],
      ),
      leading: Flag.fromCode(
        flagCode,
        fit: BoxFit.cover,
        height: 25,
        width: 38,
      ),
      onTap: () {
        settingsController.selectedLanguage.value = title;
        settingsController.selectedLanguageIcon.value = flagCode;
        // LanguageSelectionScreen.selectedLanguage = title;
        // LanguageSelectionScreen.selectedLanguageIcon = flagCode;
        Navigator.pop(context);
      },
    );
  }
}
