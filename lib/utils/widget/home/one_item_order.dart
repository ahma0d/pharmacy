import 'package:flutter/material.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/laboratory/all_order_laboratory.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

import '../../../pharmacyManagement/admin/model/company/all_orders_model.dart';

class OneItemOrder extends StatelessWidget {
  const OneItemOrder({Key? key,  this.ordersCompanyModel, required this.isCompany , this.laboratoryModel}) : super(key: key);
  final OrdersCompanyModel? ordersCompanyModel;
  final AllOrderLaboratoryModel? laboratoryModel;
  final bool isCompany;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        //color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8.0),
      ),
      width: double.infinity,
      height: 200,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const  [
               Image(
                image: AssetImage("assets/images/open.png"),
                width: 130.0,
                height: 140.0,
              ),
              SizedBox(
                height: 20.0,
              ),

            ],
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
                  text: isCompany == true? "Order Number :  ${ordersCompanyModel!.orderNumber}" : "Name Medicine : ${laboratoryModel!.title} ",
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                NormalText(
                  text: isCompany == true? "Name Company : ${ordersCompanyModel!.companyOrderModel.name}": "Name Laboratory :  ${laboratoryModel!.laboratoryModel.name}",
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    NormalText(
                      text: isCompany == true? "Order Id : " : "Status ",
                      fontWeight: FontWeight.w800,
                    ),
                    NormalText(
                      text: isCompany == true?ordersCompanyModel!.id.toString() : laboratoryModel!.status,
                      colorText: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    NormalText(
                      text:isCompany == true? "Total Price : " : "quantity : ",
                      fontWeight: FontWeight.w800,
                    ),
                    NormalText(
                      text: isCompany == true? "${ordersCompanyModel!.totalPrice} s.y" : laboratoryModel!.quantity.toString(),
                      colorText: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                NormalText(
                  text: isCompany == true? ordersCompanyModel!.createIt : laboratoryModel!.createAt,
                  sizeText: 16.0,
                  fontWeight: FontWeight.bold,
                  colorText: Colors.grey,
                ),
                Row(
                  children: const [

                     SizedBox(
                      width: 12.0,
                    ),
                    // BasicBottom(
                    //   height: 20.0,
                    //   width: 20.0,
                    //   borderRadius: 8.0,
                    //   colorContainer: Colors.red,
                    //   text: "Delete",
                    //   onPressed: () {},
                    // ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
