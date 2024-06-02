import 'package:flutter/material.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/company/order_specific_company_model.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

import '../../../pharmacyManagement/admin/model/company/all_orders_model.dart';

class OneItemPrivateDetailsOrder extends StatelessWidget {
  const OneItemPrivateDetailsOrder({Key? key , required this.specificOrderModel, required this.index }) : super(key: key);
  final SpecificOrderModel specificOrderModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 152,
      color: Colors.white,
      child: Row(
        children: [
          const Image(
            image: AssetImage('assets/images/open.png'),
            height: 80,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 6.0,
                ),
                NormalText(
                  text: specificOrderModel.companyOrderModel!.name.toString(),
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10,),
                NormalText(
                  text: "Price  ${specificOrderModel.model[index].price}",
                  fontWeight: FontWeight.w600,
                  colorText: Colors.grey,
                  sizeText: 14,
                ),
                const SizedBox(height: 10.0,),
                NormalText(
                  text: "quantity   ${specificOrderModel.model[index].buyOrderItemModel.quantity*specificOrderModel.model[index].price} ",
                  fontWeight: FontWeight.w500,
                  colorText: Colors.grey,
                  sizeText: 14,
                ),
                const SizedBox(height: 10.0,),
                NormalText(
                  text: "total price ${specificOrderModel.model[index].buyOrderItemModel.quantity}",
                  fontWeight: FontWeight.w500,
                  colorText: Colors.grey,
                  sizeText: 14,
                ),
                const SizedBox(height: 10,),
                NormalText(
                  text: "${specificOrderModel.model[index].productOrderCompanyModel.barcode}" "  Barcode Product",
                  sizeText: 12,
                ),
                const SizedBox(height: 10,),
                NormalText(
                  text: "Expiration Date " "${specificOrderModel.createIt}",
                  sizeText: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

