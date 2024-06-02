import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/laboratory/all_order_laboratory.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/laboratory/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/laboratory/states.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

class PrivateOrderLaboratory extends StatelessWidget {
  const PrivateOrderLaboratory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<LaboratoryCubit, LaboratoryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! PrivateOrdersLaboratoryLoadingState,
            builder: (context) {
              var cubit = LaboratoryCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: AllColors.appColor,
                  elevation: 0.0,
                  title: NormalText(
                    text: "Order Laboratory Details ",
                    colorText: Colors.white,
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: AlignmentDirectional.centerEnd,
                        width: 250,
                        height: 300,
                        child: const Image(
                          image: AssetImage('assets/images/open.png'),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      NormalText(
                        text: "Description",
                        sizeText: 25.0,
                        fontWeight: FontWeight.w700,
                        colorText: AllColors.appColor,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      NormalText(
                        text: cubit.privateOrderLaboratoryModel!.description.toString(),
                        colorText: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      NormalText(
                        text: "Usage",
                        sizeText: 25.0,
                        fontWeight: FontWeight.w700,
                        colorText: AllColors.appColor,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      NormalText(
                        text : cubit.privateOrderLaboratoryModel!.use.toString(),
                        colorText: Colors.grey,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NormalText(
                                text: "Status",
                                sizeText: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              NormalText(text: cubit.privateOrderLaboratoryModel!.status)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NormalText(
                                text: "Order Number",
                                sizeText: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              NormalText(text: cubit.privateOrderLaboratoryModel!.orderNumber.toString())
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NormalText(
                                text: "Name Laboratory",
                                sizeText: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              NormalText(text: cubit.privateOrderLaboratoryModel!.laboratoryModel.name.toString())
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      NormalText(
                        text: "Created At",
                        sizeText: 25.0,
                        fontWeight: FontWeight.w700,
                        colorText: AllColors.appColor,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      NormalText(
                        text: cubit.privateOrderLaboratoryModel!.createdAt.toString(),
                        colorText: Colors.grey,
                      )
                    ],
                  ),
                ),
              );
            },
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
