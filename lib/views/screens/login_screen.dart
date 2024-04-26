// ignore_for_file: prefer_const_constructors

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lomark/Route/app_routes.dart';
import 'package:lomark/controllers/login_screen_controller.dart';
import 'package:lomark/main.dart';
import 'package:lomark/model/user.dart';
import 'package:phone_input/phone_input_package.dart';

class LoginScreen extends StatelessWidget {
  final LoginScreenController loginScreenController =
      Get.put<LoginScreenController>(LoginScreenController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: mq.height * .10),
          child: FloatingActionButton.extended(
            icon: Icon(Icons.logout),
            backgroundColor: Colors.grey.shade300,
            label: Text("Sign up"),
            onPressed: () async {
              await loginScreenController
                  .createUser(
                    loginScreenController.name,
                    loginScreenController.phone,
                    loginScreenController.role,
                  )
                  .then(
                    (value) => Get.offNamed(AppRoutes.home),
                  );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: mq.height * .18,
              ),
              Text(
                'Welcome to ',
                style: TextStyle(
                    fontSize: mq.height * .05, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: mq.height * .07,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mq.width * .07),
                child: TextFormField(
                  onChanged: (value) {
                    loginScreenController.name = value;
                  },
                  validator: (value) {
                    if (value!.length <= 4 && value.length >= 15) {
                      return "Invalid name";
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * .05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mq.width * .07),
                child: PhoneInput(
                    onChanged: (value) {
                      loginScreenController.phone = value!;
                    },
                    defaultCountry: IsoCode.IN,
                    // controller: loginScreenController.phoneController,
                    decoration: InputDecoration(
                      hintText: "Phone number",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    countrySelectorNavigator:
                        const CountrySelectorNavigator.dialog()),
              ),
              SizedBox(
                height: mq.height * .05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mq.width * .07),
                child: DropDownTextField(
                    onChanged: (value) {
                      if (value == 'Buyer') {
                        loginScreenController.role = Type.buyer;
                      } else {
                        loginScreenController.role = Type.seller;
                      }
                    },
                    clearOption: true,
                    textFieldDecoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Your Role"),
                    validator: (value) {
                      if (value == null) {
                        return "Required field";
                      } else {
                        return null;
                      }
                    },
                    dropDownItemCount: 2,
                    dropDownList: const [
                      DropDownValueModel(name: 'Buyer', value: 'Buyer'),
                      DropDownValueModel(name: 'Seller', value: 'Seller'),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
