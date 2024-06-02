import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/employee/all_employee.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/home/home_screen.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/search/search_screen.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/search/search_screen_2.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/company/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/company/states.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';
import 'package:pharmacy_system/utils/widget/grud/drug_home.dart';
import 'package:pharmacy_system/utils/widget/grud/top_category.dart';

import '../../../../../utils/widget/home/main_tile.dart';
import '../../../../../utils/widget/home/sub_title.dart';

Color color = Color(0xff009ca2);

class HomeUp extends StatefulWidget {
  const HomeUp({Key? key}) : super(key: key);

  @override
  State<HomeUp> createState() => _HomeUpState();
}

class _HomeUpState extends State<HomeUp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<CompanyCubit, CompanyStates>(
      listener: (context,state){},
      builder:(context,state) {
        return  Scaffold(
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: size.height / 15),
              child: Column(
                children: [
                  MainTitle(
                    size: size,
                    title: 'Home Pharmacy',
                  ),
                  Upload(size, context),
                  SubTitle(
                    Icons.format_paint,
                    'All Drugs',
                    color,
                    18,
                    true,
                        () {
                      navigateTo(
                        context: context,
                        screen: const HomeScreen(),
                      );
                    },
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          CompanyCubit.get(context)
                              .allMedicineCompany.length,
                              (index) => index <= CompanyCubit.get(context)
                                  .allMedicineCompany.length - 2
                              ? DrugHome(
                            index: index,
                            allMedicineCompanyModel: CompanyCubit.get(context)
                                .allMedicineCompany[index],
                          )
                              : InkWell(
                            onTap: () {
                              navigateTo(
                                  context: context,
                                  screen: const HomeScreen());
                            },
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 7),
                              margin: EdgeInsets.only(
                                  left: size.height / 70,
                                  top: size.height / 90),
                              height: size.height * .24,
                              width: size.height * .16,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(width: 0.1),
                              ),
                              child: NormalText(
                                text: "See All",
                                sizeText: 24.0,
                                fontWeight: FontWeight.bold,
                                colorText: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SubTitle(
                    Icons.group,
                    'All Employee',
                    color,
                    18,
                    true,
                        () {
                      navigateTo(context: context, screen: AllEmployee());
                    },
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          4,
                              (index) => index <= 2
                              ? TopCategory(
                            index: index - 1,
                          )
                              : InkWell(
                            onTap: () {
                              navigateTo(
                                  context: context, screen: AllEmployee());
                            },
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 7),
                              margin: EdgeInsets.only(
                                  left: size.height / 70,
                                  top: size.height / 90),
                              height: size.height * .24,
                              width: size.height * .16,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(width: 0.1),
                              ),
                              child: NormalText(
                                text: "See All",
                                sizeText: 24.0,
                                fontWeight: FontWeight.bold,
                                colorText: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

Widget Upload(size, context) => Container(
      padding: EdgeInsets.all(size.height / 70),
      child: Row(children: [
        InkWell(
          onTap: () {
            navigateTo(context: context, screen: SearchScreen2());
          },
          child: Container(
            margin: EdgeInsets.only(right: size.height / 80),
            height: size.height * .07,
            width: size.width * .75,
            decoration: BoxDecoration(
              color: Colors.white24,
              border: Border.all(color: color, width: .7),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                NormalText(
                  text: 'Search',
                  sizeText: 16,
                  colorText: color,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: size.width / 70),
          height: size.height * .07,
          width: size.width / 7.7,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Icon(
              Icons.list_sharp,
              size: 24,
              color: Colors.white,
            ),
          ),
        )
      ]),
    );
