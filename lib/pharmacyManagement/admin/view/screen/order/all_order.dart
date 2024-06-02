import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/company/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/company/states.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/laboratory/cubit.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/icon_button.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';
import 'package:pharmacy_system/utils/widget/home/one_item_order.dart';

import '../../../view_model/all_cubit/laboratory/states.dart';
import 'details_one_item_order.dart';

class AllOrder extends StatelessWidget {
  const AllOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.appColor,
        elevation: 0.0,
        title: NormalText(
          text: "Order Pharmacy",
          colorText: Colors.white,
          fontWeight: FontWeight.bold,
          sizeText: 20.0,
        ),
        actions: [
          DefaultIconButton(
            iconData: Icons.search,
            onPressed: () {},
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50.0,
              width: double.infinity,
              color: AllColors.appColor,
              child: Container(
                width: 400,
                margin: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: TabBar(
                  unselectedLabelColor: const Color(0xff8E90C7),
                  physics: const BouncingScrollPhysics(),
                  indicator: const BoxDecoration(
                    color: Colors.white,
                  ),
                  dividerColor: Colors.red,
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: NormalText(
                          text: "Company",
                          colorText: Colors.black87,
                          sizeText: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Align(
                          alignment: Alignment.center,
                          child: NormalText(
                            text: "Laboratory",
                            sizeText: 16.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  BlocConsumer<CompanyCubit, CompanyStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return ConditionalBuilder(
                          condition: CompanyCubit.get(context).list.isNotEmpty,
                          builder: (context) {
                            return ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  CompanyCubit.get(context).getPrivateOrderId(id:  CompanyCubit.get(context).list[index].id);
                                  navigateTo(
                                    context: context,
                                    screen: DetailsOneItemOrder(
                                      isCompany: true,
                                      specificOrderModel: CompanyCubit.get(context).specificOrderModel,
                                      ordersCompanyModel:
                                          CompanyCubit.get(context).list[index],
                                    ),
                                  );
                                },
                                child: OneItemOrder(
                                  isCompany: true,
                                  ordersCompanyModel:
                                      CompanyCubit.get(context).list[index],
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                thickness: 1.5,
                              ),
                              itemCount: CompanyCubit.get(context).list.length,
                            );
                          },
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }),
                  BlocConsumer<LaboratoryCubit, LaboratoryStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return ConditionalBuilder(
                        condition: state is! AllOrdersLaboratoryLoadingState,
                        builder: (context) => ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              LaboratoryCubit.get(context).getPrivateOrderLaboratory(id: index+1);

                              if(state is PrivateOrdersLaboratorySuccessState){
                                navigateTo(
                                  context: context,
                                  screen:  DetailsOneItemOrder(
                                    isCompany: false,
                                  ),);
                              }
                            },
                            child: OneItemOrder(
                                isCompany: false,
                                laboratoryModel: LaboratoryCubit.get(context)
                                    .allOrderLaboratory[index]),
                          ),
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: LaboratoryCubit.get(context)
                              .allOrderLaboratory
                              .length,
                        ),
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
