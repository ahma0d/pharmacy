import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/company/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/company/states.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';
import 'package:pharmacy_system/utils/widget/cart/after_list_cart.dart';
import 'package:pharmacy_system/utils/widget/cart/one_item_cart.dart';
import '../../../model/company/all_orders_model.dart';
import '../../../model/company/order_specific_company_model.dart';
import '../laboratory/private_order_laboratory.dart';

class DetailsOneItemOrder extends StatelessWidget {
  DetailsOneItemOrder({
    Key? key,
    required this.isCompany,
    this.ordersCompanyModel,
    this.index,
    this.specificOrderModel,

  }) : super(key: key);
  final bool isCompany;
  SpecificOrderModel? specificOrderModel;
  OrdersCompanyModel? ordersCompanyModel;
  int? index;

  @override
  Widget build(BuildContext context) {
    return isCompany == true
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: AllColors.appColor,
              elevation: 0.0,
              title: NormalText(
                text: "Details Order",
                sizeText: 20.0,
                fontWeight: FontWeight.w700,
                colorText: Colors.white,
              ),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 550,
                  child: BlocConsumer<CompanyCubit, CompanyStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return ConditionalBuilder(
                          condition: state is! GetPrivateOrderLoadingState,
                          builder: (context) => ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                OneItemPrivateDetailsOrder(
                                    index: index,
                                    specificOrderModel:
                                        CompanyCubit.get(context)
                                            .specificOrderModel!),
                            separatorBuilder: (context, index) => const Divider(
                              thickness: 1.5,
                            ),
                            itemCount: CompanyCubit.get(context)
                                .specificOrderModel!
                                .model
                                .length,
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                NormalText(
                  text: "Order ",
                  sizeText: 20.0,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                AfterCart(
                    textRight: ordersCompanyModel!.orderNumber.toString(),
                    textLeft: "Order Number"),
                const SizedBox(
                  height: 10.0,
                ),
                AfterCart(
                    textRight: ordersCompanyModel!.type.toString(),
                    textLeft: "type"),
                const SizedBox(
                  height: 10.0,
                ),
                AfterCart(
                    textRight:
                        ordersCompanyModel!.companyOrderModel.name.toString(),
                    textLeft: "Company"),
                const SizedBox(
                  height: 10.0,
                ),
                AfterCart(
                  textRight: ordersCompanyModel!.totalPrice.toString(),
                  textLeft: "total Price Order",
                  leftText: Colors.black,
                  rightText: Colors.black,
                ),
                const Spacer(),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: BasicBottom(
                //     text: "Pay Now",
                //     colorText: Colors.white,
                //     fontWeight: FontWeight.w700,
                //     sizeText: 20.0,
                //     onPressed: () {},
                //   ),
                // ),
                const SizedBox(
                  height: 6.0,
                ),
              ],
            ),
          )
        :  const PrivateOrderLaboratory();
  }
}
