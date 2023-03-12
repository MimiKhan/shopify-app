
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/cart_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/login_controller.dart';
import 'package:lime_light_copy_shopify_store/views/checkout/pre_checkout_screen.dart';
import 'package:lime_light_copy_shopify_store/views/login/components/my_button.dart';
import 'package:lime_light_copy_shopify_store/views/login/components/my_textfield.dart';
import 'package:lime_light_copy_shopify_store/views/main_ui/main_screen.dart';

enum LoginRoute {
  cartScreen,
  settingsScreen
}


class LoginPage extends StatefulWidget {
  final LoginRoute loginRoute;

  const LoginPage({super.key, required this.loginRoute});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = Get.find<LoginController>();
  final cartController = Get.find<CartController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // text editing controllers
  final emailController = TextEditingController(text: 'mimimurdana@gmail.com');

  final passwordController = TextEditingController(text: 'Murdana007');

  // sign user in method
  signUserIn() async {

    String email = emailController.text;
    String password = passwordController.text;


    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );

    // try sign in
    try {

      await loginController.signInWithEmailPass(email: email, password: password).then((value) {
        Fluttertoast.showToast(msg: "User signed in as : ${loginController.currentUser.value?.email}");
        debugPrint("User signed in as : ${loginController.currentUser.value?.email}");
        if(widget.loginRoute == LoginRoute.cartScreen){
          Get.to(()=>PreCheckoutScreen(cartModelItems: cartController.cartModelItems));
        }else if(widget.loginRoute == LoginRoute.settingsScreen){
          Fluttertoast.showToast(msg: "Routing to Settings");
          Get.to(() => MainScreen(selectedIndex: 4));
        }
      });



    } on Exception catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.toString());
    }
  }

  // error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  text: "Sign In",
                  onTap: signUserIn,
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     // google button
                //     SquareTile(
                //       imagePath: 'assets/images/google.png',
                //       onTap: () => AuthService().signInUserGoogle(),
                //     ),
                //
                //     SizedBox(width: 25),
                //
                //     // facebook button
                //     SquareTile(
                //       imagePath: 'assets/images/facebook.png',
                //       onTap: () => AuthService().signInWithFacebook(),
                //     ),
                //
                //     SizedBox(width: 25),
                //
                //     // facebook button
                //     SquareTile(
                //       imagePath: 'assets/images/smartphone.png',
                //       onTap: () => Get.toNamed('/phoneLogin'),
                //     ),
                //
                //   ],
                // ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed('/registerScreen');
                      },
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
