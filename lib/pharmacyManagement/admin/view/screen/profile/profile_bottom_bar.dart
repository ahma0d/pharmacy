import 'package:flutter/material.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/company/all_company.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/employee/all_employee.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/laboratory/all_laboratory.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/profile/profile_admin.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/setting/setting_screen.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/auth/login/cubit.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_botton.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';
import 'package:pharmacy_system/utils/widget/profile/profile_home.dart';

import '../setting/all_promo_code.dart';
import '../setting/mycart.dart';

class ProfilBottomBar extends StatelessWidget {
  const ProfilBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context).loginModel!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AllColors.appColor,
        // title: NormalText(
        //   text: "Profiles",
        //   sizeText: 18.0,
        //   fontWeight: FontWeight.w800,
        //   colorText: Colors.white,
        // ),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              navigateTo(context: context, screen: ProfileAdmin());
            },
            child: Container(
              height: 120.0,
              color: AllColors.appColor,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 60.0,
                      foregroundImage: AssetImage(
                        "assets/images/1.jpg",
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalText(
                            text: cubit.employeeModel.name,
                            colorText: Colors.white,
                            sizeText: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          NormalText(
                            text: cubit.employeeModel.email,
                            colorText: Colors.grey.shade200,
                            sizeText: 14.0,
                            maxLine: 1,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 90.0,
                              height: 20.0,
                              padding:
                                  const EdgeInsets.only(left: 6.0, right: 8.0),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.edit,
                                    size: 18.0,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  NormalText(
                                    text: "Edit",
                                    colorText: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ProfileBottom(
                  icon: Icons.settings,
                  text: "Setting",
                  onPressed: () {
                    navigateTo(
                      context: context,
                      screen: const SettingScreen(),
                    );
                  },
                ),
                const Divider(
                  thickness: 1.5,
                ),
                ProfileBottom(
                  icon: Icons.shopping_cart_outlined,
                  text: "My Cart",
                  onPressed: () {
                    navigateTo(
                      context: context,
                      screen: const MyCart(),
                    );
                  },
                ),
                const Divider(
                  thickness: 1.5,
                ),
                ProfileBottom(
                  icon: Icons.monetization_on_sharp,
                  text: "Bromocode",
                  onPressed: () {
                    navigateTo(
                      context: context,
                      screen: const AllPromoCode(),
                    );
                  },
                ),
                const Divider(
                  thickness: 1.5,
                ),
                ProfileBottom(
                  icon: Icons.checkroom_outlined,
                  text: "Laboratory",
                  onPressed: () {
                    navigateTo(context: context, screen: const MyLaboratory());
                  },
                ),
                const Divider(
                  thickness: 1.5,
                ),
                ProfileBottom(
                  icon: Icons.people,
                  text: "My Employee",
                  onPressed: () {
                    navigateTo(
                      context: context,
                      screen: AllEmployee(),
                    );
                  },
                ),
                const Divider(
                  thickness: 1.5,
                ),
                ProfileBottom(
                  icon: Icons.maps_home_work_outlined,
                  text: "Contact Company",
                  onPressed: () {
                    navigateTo(
                      context: context,
                      screen: const AllCompany(),
                    );
                  },
                ),
                const Divider(
                  thickness: 1.5,
                ),
                ProfileBottom(
                  icon: Icons.logout,
                  text: "Log out",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          DefaultTextButton(
                            text: "No",
                            onPressed: () {
                              navigateBack(context: context);
                            },
                            fontWeight: FontWeight.w700,
                          ),
                          DefaultTextButton(
                            text: "Yes",
                            onPressed: () {
                              // clear token and Navigate to Login Screen
                            },
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                          )
                        ],
                        title: NormalText(
                          text: "Are you sure to Log out ? ",
                          fontWeight: FontWeight.w800,
                          sizeText: 20.0,
                        ),
                      ),
                    );
                  },
                ),
                const Divider(
                  thickness: 1.5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
