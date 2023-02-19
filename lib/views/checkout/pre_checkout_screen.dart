import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/cart_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/checkout_controller.dart';
import 'package:lime_light_copy_shopify_store/services/network.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/shopify_user/address/address.dart';
import 'package:lime_light_copy_shopify_store/views/cart/cart_model.dart';
import 'package:lime_light_copy_shopify_store/views/cart/cart_screen.dart';
import 'package:lime_light_copy_shopify_store/views/checkout/checkout_screen.dart';

class PreCheckoutScreen extends StatefulWidget {
  const PreCheckoutScreen({Key? key, required this.cartModelItems})
      : super(key: key);

  final List<CartModel> cartModelItems;

  @override
  State<PreCheckoutScreen> createState() => _PreCheckoutScreenState();
}

class _PreCheckoutScreenState extends State<PreCheckoutScreen> {
  final checkoutController = Get.find<CheckoutController>();
  final cartController = Get.find<CartController>();

  String _firstName = 'Haider',
      _lastName = 'Khan',
      _address = 'Flat 4 103 Huddleston road',
      _city = 'London',
      _province = 'London',
      _country = 'United Kingdom',
      _zip = 'N70EH',
      _phone = '+447576298713';

  String _dialCode = '+44 ';

  final _firstNameController = TextEditingController(text: "Haider");
  final _lastNameController = TextEditingController(text: "Khan");
  final _addressController = TextEditingController(text: "Flat 4 103 Huddleston road");
  final _cityController = TextEditingController(text: "London");
  final _provinceController = TextEditingController(text: "London");
  final _zipController = TextEditingController(text: "N70EH");
  final _countryController =
      TextEditingController(text: "United Kingdom");
  final _phoneController = TextEditingController(text: "7576298713");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Get.off(() => CartScreen()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(CupertinoIcons.arrowtriangle_left_fill),
              Text('Cart'),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              debugPrint("""
                            firstName: ${_firstNameController.text},$_firstName,
                                lastName: ${_lastNameController.text},
                                address1: ${_addressController.text},
                                city: ${_cityController.text},
                                country: $_country,
                                zip: ${_zipController.text},
                                phone: $_phone
                                """);
              var lineItems = await cartController
                  .getLineItems(cartController.cartModelItemsSelected.value);
              // var position = await Network().getCoordinatesFromAddress("$_address,$_city,$_country,$_zip");
              // debugPrint('${position.latitude} , ${position.longitude}');
              var address = Address(
                  name: "Mimi Khan",
                  firstName: _firstName,
                  lastName: _lastName,
                  address1: _address,
                  countryCode: "GB",
                  city: _city,
                  province: _province,
                  country: _country,
                  zip: _zip,
                  phone: _phone
              );
              await checkoutController
                  .createCheckoutFromCart(lineItems, address)
                  .then((v) {
                    // return checkoutController.updateData(checkoutController.checkout);
                    return Get.to(() => const CheckoutScreen());

                  });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text('Proceed'),
                Icon(CupertinoIcons.arrowtriangle_right_fill),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),

              const Center(
                  child: Text(
                'Customer Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )),

              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 380,
                height: 45,
                child: GetX<CartController>(builder: (nestedCartController) {
                  var countryNames = nestedCartController.countryData
                      .map((element) => element.name!)
                      .toList();

                  return Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return countryNames.where((item) {
                        return item
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    onSelected: (item) {
                      setState(() {
                        _country = item;
                        debugPrint("Country : $_country");
                        int index = nestedCartController.countryData
                            .indexWhere((element) => element.name == item);
                        _dialCode =
                            '${nestedCartController.countryData[index].dialCode!} ';
                        debugPrint('Data : $_dialCode : ');
                      });
                    },
                    initialValue: _countryController.value,
                    fieldViewBuilder:
                        (context, controller, focusNode, onEditingComplete) {
                      return TextFormField(
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                          disabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          focusedErrorBorder: OutlineInputBorder(),
                          labelText: 'Country',
                        ),
                        style: const TextStyle(fontSize: 17),
                        controller: controller,
                        focusNode: focusNode,
                        onEditingComplete: onEditingComplete,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Country';
                          }
                          return null;
                        },
                        onChanged: (value) => _country = value,
                      );
                    },
                  );
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 380,
                height: 45,
                child: TextFormField(
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    focusedErrorBorder: OutlineInputBorder(),
                    labelText: 'First Name',
                  ),
                  controller: _firstNameController,
                  style: const TextStyle(fontSize: 17),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _firstName = value;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 380,
                height: 45,
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    focusedErrorBorder: OutlineInputBorder(),
                    labelText: 'Last Name',
                  ),
                  style: const TextStyle(fontSize: 17),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  onChanged: (value) => _lastName = value,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 380,
                height: 45,
                child: TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    focusedErrorBorder: OutlineInputBorder(),
                    labelText: 'Address',
                  ),
                  keyboardType: TextInputType.streetAddress,
                  style: const TextStyle(fontSize: 17),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your complete address.';
                    }
                    return null;
                  },
                  onChanged: (value) => _address = value,
                ),
              ),
              // const SizedBox(height: 20,),
              // SizedBox(
              //   width: 380,
              //   height: 45,
              //   child: TextFormField(
              //     decoration: const InputDecoration(
              //       enabledBorder: OutlineInputBorder(),
              //       disabledBorder: OutlineInputBorder(),
              //       focusedBorder: OutlineInputBorder(),
              //       focusedErrorBorder: OutlineInputBorder(),
              //       labelText: 'Address 2',
              //     ),
              //     keyboardType: TextInputType.streetAddress,
              //     controller: _address2EditingController,
              //     style: const TextStyle(fontSize: 17),
              //     validator: (value) {
              //       if (value!.isEmpty) {
              //         return 'Please enter your address.';
              //       }
              //       return value;
              //     },
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 380,
                height: 45,
                child: TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    focusedErrorBorder: OutlineInputBorder(),
                    labelText: 'City',
                  ),
                  style: const TextStyle(fontSize: 17),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your City';
                    }
                    return null;
                  },
                  onChanged: (value) => _city = value,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 380,
                height: 45,
                child: TextFormField(
                  controller: _provinceController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    focusedErrorBorder: OutlineInputBorder(),
                    labelText: 'Province',
                  ),
                  style: const TextStyle(fontSize: 17),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Province';
                    }
                    return null;
                  },
                  onChanged: (value) => _province = value,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 380,
                height: 45,
                child: TextFormField(
                  controller: _zipController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    focusedErrorBorder: OutlineInputBorder(),
                    labelText: 'Zip Code',
                  ),
                  keyboardType: TextInputType.text,
                  style: const TextStyle(fontSize: 17),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your City';
                    }
                    return null;
                  },
                  onChanged: (value) => _zip = value,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 380,
                height: 45,
                child: TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    prefixText: _dialCode,
                    enabledBorder: const OutlineInputBorder(),
                    disabledBorder: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(),
                    focusedErrorBorder: const OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(fontSize: 17),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Phone Number';
                    }
                    return null;
                  },
                  onChanged: (value) =>
                      _phone = (_dialCode + value).removeAllWhitespace,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              /*Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.off(() => CartScreen()),
                      child: Row(
                        children: const [
                          Icon(Icons.arrow_back_ios_new_outlined),
                          Text('Back to Cart'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        debugPrint("""
                            firstName: ${_firstNameController.text},$_firstName,
                                lastName: ${_lastNameController.text},
                                address1: ${_addressController.text},
                                city: ${_cityController.text},
                                country: $_country,
                                zip: ${_zipController.text},
                                phone: $_phone
                                """);
                        var lineItems = await cartController.getLineItems(
                            cartController.cartModelItemsSelected.value);
                        var address = Address(
                            name: "Mimi Khan",
                            firstName: _firstName,
                            lastName: _lastName,
                            address1: _address,
                            countryCode: "AE",
                            address2: "nadkjfbasdjfbjads",
                            formattedArea: "abdsjhabd",
                            company: "Self",
                            id: "sandk",
                            city: _city,
                            province: _province,
                            country: _country,
                            zip: _zip,
                            phone: _phone);
                        await checkoutController
                            .createCheckoutFromCart(lineItems, address)
                            .then((v) => Get.to(() => const CheckoutScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: Colors.black,
                          elevation: 10,
                          fixedSize: const Size(150, 40)),
                      child: const Text(
                        'Proceed',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
