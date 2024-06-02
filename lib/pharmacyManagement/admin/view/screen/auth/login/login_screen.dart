import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/auth/forget_password/forget_password.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/auth/login/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/auth/login/state.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/basic_bottom.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_botton.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_form_field.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

import '../../../../../../utils/fucntion/circle_center.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){},
      builder:(context,state) =>  Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 450,
                child: SvgPicture.asset("assets/images/login.svg"),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      DefaultFormField(
                        hint: "Email",
                        prefixIcon: Icons.email,
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return "Enter your email";
                          }
                          if (!value.contains("@")) {
                            return "please you should input @ in your email";
                          }
                          return null;
                        },
                        borderRadius: 12.0,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                     DefaultFormField(
                          hint: "Password",
                          borderRadius: 12.0,
                          enableBorderColor: AllColors.appColor,
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return "Enter your password ";
                            }
                            return null;
                          },
                          obscure: LoginCubit.get(context).password,
                          prefixIcon: Icons.lock,
                          suffixIcon: Icons.visibility_off,
                          onPressed: () {
                            LoginCubit.get(context).changePassword();
                          },
                        ),

                      const SizedBox(
                        height: 30.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder:(context) =>  BasicBottom(
                          height: 60.0,
                          text: "Login",
                          sizeText: 25.0,
                          fontWeight: FontWeight.bold,
                          colorText: Colors.white,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {

                              LoginCubit.get(context).loginAdmin(
                                email: emailController.text,
                                password: passwordController.text,
                                context: context,
                              );
                            }
                          },
                        ),
                        fallback: (context) =>  const Center(child: CircularProgressIndicator(),),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: DefaultTextButton(
                          color: Colors.black,
                          text: "Forget Password",
                          onPressed: () {
                            navigateTo(
                                context: context, screen: ForgetPassword());
                            // call Api Forget Password
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class myClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 70);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
