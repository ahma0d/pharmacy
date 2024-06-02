import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/home/bottom_screen.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/auth/login/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/auth/login/state.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/core/constance/token.dart';
import 'package:pharmacy_system/utils/core/save/shared_pref.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/basic_bottom.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

class VerifyScreen extends StatelessWidget {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginVerifySuccessState) {
          if (state.loginModel.operation == "Succeed") {
            SharedPref.saveData(
                    key: 'token', value: state.loginModel.token.toString())
                .then(
              (value) {
                tokenData = state.loginModel.token;

                navigateAndFinish(
                    context: context, screen: const BottomScreen());
              },
            );
          }
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: NormalText(
            text: "Verify code ",
            colorText: Colors.white,
            sizeText: 20.0,
          ),
          backgroundColor: AllColors.appColor,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: Center(
          child: SafeArea(
            child: Scaffold(
              //backgroundColor: const Color(0xff111355),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 250,
                                  child: SvgPicture.asset(
                                      'assets/images/check_email.svg',
                                      fit: BoxFit.cover),
                                ),
                                const SizedBox(
                                  height: 50.0,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Verify",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 36,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Check your email and verify code",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff667085),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 64,
                                        height: 68,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: controller1,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            borderSide: const BorderSide(
                                              color: AllColors.appColor,
                                            ),
                                          )),
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {
                                            if (value.length == 1) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 64,
                                        height: 68,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            borderSide: const BorderSide(
                                              color: AllColors.appColor,
                                            ),
                                          )),
                                          controller: controller2,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {
                                            if (value.length == 1) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 64,
                                        height: 68,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            borderSide: const BorderSide(
                                              color: AllColors.appColor,
                                            ),
                                          )),
                                          controller: controller3,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {
                                            if (value.length == 1) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 64,
                                        height: 68,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            borderSide: const BorderSide(
                                              color: AllColors.appColor,
                                            ),
                                          )),
                                          controller: controller4,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {
                                            if (value.length == 1) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 80,
                                ),
                                BlocConsumer<LoginCubit, LoginStates>(
                                    listener: (context, state) {},
                                    builder: (context, state) {
                                      return ConditionalBuilder(
                                        condition: state is! LoginVerifyLoadingState,
                                        builder: (context) => Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: BasicBottom(
                                            colorText: Colors.white,
                                            text: "Verify",
                                            onPressed: () {
                                              LoginCubit.get(context)
                                                  .verifyCode(
                                                context: context,
                                                code:
                                                    "${controller1.text}${controller2.text}${controller3.text}${controller4.text}",
                                              );
                                            },
                                          ),
                                        ),
                                        fallback: (context) => const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    }),
                                const SizedBox(
                                  height: 90.0,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 30,
                                    width: double.infinity,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: RichText(
                                        text: const TextSpan(
                                          text: "Don't receive code ? ",
                                          style: TextStyle(
                                              color: Color(0xff344054),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'Resend Email',
                                              style: TextStyle(
                                                  color: Color(0xff1C208F),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
