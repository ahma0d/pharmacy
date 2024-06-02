import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/grud/details_grud.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/search/search_screen_2.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/company/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/company/states.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/employee/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/home/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/home/states.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/laboratory/cubit.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/icon_button.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';
import 'package:pharmacy_system/utils/widget/grud/one_item_all_grud_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: HomeCubit.get(context).allGruds.isNotEmpty,
            builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: AllColors.appColor,
                  elevation: 0.0,
                  title: NormalText(
                    text: "Gruds Pharmacy",
                    colorText: Colors.white,
                    sizeText: 20.0,
                    fontWeight: FontWeight.w800,
                  ),
                  actions: [
                    BlocConsumer<CompanyCubit, CompanyStates>(
                      listener: (context, state) {},
                      builder: (context, state) => DefaultIconButton(
                        iconData: Icons.notifications,
                        onPressed: () {
                          CompanyCubit.get(context).searchProduct(text: 'a');
                        },
                      ),
                    ),
                    DefaultIconButton(
                      iconData: Icons.search,
                      onPressed: () {
                        navigateTo(
                          context: context,
                          screen: SearchScreen2(),
                        );
                      },
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        padding: const EdgeInsets.all(12.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: HomeCubit.get(context).allGruds.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 250,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  navigateTo(
                                      context: context,
                                      screen: DetailsGruds(
                                        allMedicineCompanyModel:
                                        HomeCubit.get(context).allGruds[index],
                                      ));
                                },
                                child: OneItemAllGrud(
                                  allMedicineCompanyModel:
                                  HomeCubit.get(context).allGruds[index],
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            fallback: (context) => const Center(child: CircularProgressIndicator(),),);
        });
  }
}
