import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/company/details_company.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/company/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/company/states.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/icon_button.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';
import 'package:pharmacy_system/utils/widget/company/itemOneCompany.dart';

class AllCompany extends StatelessWidget {
  const AllCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: AllColors.appColor,
          elevation: 0.0,
          title: NormalText(
            text: "All Company",
            colorText: Colors.white,
            sizeText: 20.0,
          ),
          actions: [
            DefaultIconButton(
              iconData: Icons.notifications,
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<CompanyCubit, CompanyStates>(
          builder: (context, state) => ConditionalBuilder(
            condition: CompanyCubit.get(context).allCompany.isNotEmpty,
            builder: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  navigateTo(
                    context: context,
                    screen: DetailsCompany(
                      model: CompanyCubit.get(context).allCompany[index],
                    ),
                  );
                },
                child: Item(
                  allCompanyModel: CompanyCubit.get(context).allCompany[index],
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20.0,
              ),
              itemCount: CompanyCubit.get(context).allCompany.length,
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
