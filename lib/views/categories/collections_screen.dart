import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/collections_list_controller.dart';
import 'package:lime_light_copy_shopify_store/views/categories/collections_details_screen.dart';
import 'package:lime_light_copy_shopify_store/views/main_ui/main_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  final collectionsListController = Get.find<CollectionsListController>();


  void _navigateToCollectionDetailScreen(
      String collectionId, String collectionTitle) {
    Get.to(() => CollectionDetailScreen(
        collectionId: collectionId, collectionTitle: collectionTitle));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          child: GetX<CollectionsListController>(
            builder: (controller) {
              return Column(
                      children: [
                        const SizedBox(
                          height: 45,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Collections",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  debugPrint('Search Icon here.');
                                  Get.off(MainScreen(selectedIndex: 2));
                                },
                                child: const Icon(
                                  CupertinoIcons.search,
                                  size: 29,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          itemCount: controller.collectionsList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int listViewIndex) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _navigateToCollectionDetailScreen(
                                      controller.collectionsList[listViewIndex].id,
                                      controller.collectionsList[listViewIndex].title);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: SizedBox(
                                  width: size.width - 10,
                                  height: 200,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image(
                                          image: NetworkImage(
                                              controller.collectionsList[listViewIndex]
                                                  .image!
                                                  .originalSrc),
                                          fit: BoxFit.cover,
                                          filterQuality: FilterQuality.high,
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          controller.collectionsList[listViewIndex].title,
                                          style: TextStyle(
                                              fontSize: context.textTheme
                                                  .headlineMedium!.fontSize,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
            }
          ),
        ),
      ),
    );

    /*return FutureBuilder<StoreFrontCollections>(
      future: Network.getShopifyCollectionsData(),
      builder: (BuildContext context,
          AsyncSnapshot<StoreFrontCollections> snapshot) {
        if (snapshot.hasError) {
          Fluttertoast.showToast(msg: snapshot.error.toString());
          debugPrint(snapshot.error.toString());
        }


        if (snapshot.hasData) {
          debugPrint('Snapshot(Collections) has data.');
          var collectionData = snapshot.data;
          var collections = collectionData?.data!.collections!.nodes;


          */ /*return Scaffold(
            body: Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('Recent Collections'),
                            TextButton(
                              onPressed: (){},
                              child: Text('See All'),

                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );*/ /*
        } else {
          debugPrint('No data in Snapshot');
          return Container(
            constraints: const BoxConstraints.expand(),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
      },
    );*/
  }
}
