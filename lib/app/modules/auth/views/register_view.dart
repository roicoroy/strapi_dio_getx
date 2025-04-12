import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:strapi_dio_getx/app/modules/auth/controllers/register_controller.dart';


class RegisterView extends GetView<RegisterController> {


  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    // RegisterController instance = Get.find();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // child: Form(
          //   key: instance,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const Spacer(),
          //       const Text(
          //         "Create Account,",
          //         style: TextStyle(
          //           color: Colors.black,
          //           fontSize: 32,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       const Text(
          //         "Sign up to started!",
          //         style: TextStyle(
          //           color: Colors.grey,
          //           fontSize: 22,
          //           fontWeight: FontWeight.w400,
          //           letterSpacing: 1.2,
          //         ),
          //       ),
          //       const Spacer(flex: 3),
          //       InputTextField(
          //         title: 'Full Name',
          //         textEditingController: controller.fullNameController,
          //         validation: (String? value) {
          //           if (value == null || value.isEmpty) {
          //             return "This field can't be empty";
          //           }
          //           return null;
          //         },
          //       ),
          //       const SizedBox(height: 10),
          //       InputTextField(
          //         title: 'Email',
          //         textEditingController: controller.emailController,
          //         validation: (String? value) {
          //           if (value == null || value.isEmpty) {
          //             return "This field can't be empty";
          //           } else if (!value.isValidEmail) {
          //             return "Please enter valid email";
          //           }
          //           return null;
          //         },
          //       ),
          //       const SizedBox(height: 10),
          //       InputTextField(
          //         title: 'Password',
          //         obsecureText: true,
          //         textEditingController: passwordController,
          //         validation: (String? value) {
          //           List<String> _validation = [];
          //           if (value == null || value.isEmpty) {
          //             return "This field can't be empty";
          //           } else {
          //             if (!value.isValidPasswordHasNumber) {
          //               _validation.add("Must contain 1 number");
          //             }
          //             if (!value.isValidPasswordHasCapitalLetter) {
          //               _validation.add("Must contain 1 capital letter");
          //             }
          //             if (!value.isValidPasswordHasLowerCaseLetter) {
          //               _validation.add("Must contain 1 simple letter");
          //             }
          //             if (!value.isValidPasswordHasSpecialCharacter) {
          //               _validation.add(
          //                 "Must contain 1 special character[! @ # \$ %]",
          //               );
          //             }
          //           }
          //           String msg = '';
          //           if (_validation.isNotEmpty) {
          //             for (var i = 0; i < _validation.length; i++) {
          //               msg = msg + _validation[i];
          //               if ((i + 1) != _validation.length) {
          //                 msg = msg + "\n";
          //               }
          //             }
          //           }
          //           return msg.isNotEmpty ? msg : null;
          //         },
          //       ),
          //       const SizedBox(height: 10),
          //       InputTextField(
          //         title: 'Confirm Password',
          //         obsecureText: true,
          //         textEditingController: confirmController,
          //         validation: (String? value) {
          //           if (value == null || value.isEmpty) {
          //             return "This field can't be empty";
          //           } else if (passwordController.text != value) {
          //             return "Confirm password not match";
          //           }
          //           return null;
          //         },
          //       ),
          //       const SizedBox(height: 10),
          //       const Spacer(),
          //       InputTextButton(
          //         title: "Sign Up",
          //         onClick: () {
          //           if (_formKey.currentState!.validate()) {
          //             controller.signUp(
          //               fullName: fullNameController.text,
          //               email: emailController.text,
          //               password: passwordController.text,
          //             );
          //           }
          //         },
          //       ),
          //       const SizedBox(height: 10),
          //       InputOutlineButton(
          //         title: "Back",
          //         onClick: () {
          //           Navigator.of(context).pop();
          //         },
          //       ),
          //       const Spacer(flex: 5),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           const Text("I'm already a member, "),
          //           InkWell(
          //             onTap: () {
          //               Get.toNamed(Routes.LOGIN);
          //             },
          //             child: const Text(
          //               "Sign In",
          //               style: TextStyle(color: Colors.blue),
          //             ),
          //           ),
          //         ],
          //       ),
          //       const SizedBox(height: 10),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
