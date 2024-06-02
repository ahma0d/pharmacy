import 'package:flutter/material.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

import '../all_app/text_botton.dart';
class OneItemOrderLaboratory extends StatelessWidget {
  const OneItemOrderLaboratory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.only(top: 8 , left: 8),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NormalText(text: "Build Shampoo Oliva for Medical Center" , sizeText: 20.0,fontWeight: FontWeight.w700,maxLine: 1,),
          const SizedBox(height: 6.0,),
          NormalText(text: "0998318250" , colorText: Colors.grey,sizeText: 16,),
          const SizedBox(height: 12.0,),
          NormalText(text: "10/12/2025" , colorText: Colors.grey,sizeText: 16,),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 12,
                height: 12.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              ),
              DefaultTextButton(text: "Accept", onPressed: (){},color: Colors.green),
              const SizedBox(width: 45.0,),
              Container(
                width: 12,
                height: 12.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
              ),
              DefaultTextButton(text: "reject", onPressed: (){}, color: Colors.amber,),
              const SizedBox(width: 45.0,),
              Container(
                width: 12,
                height: 12.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
              DefaultTextButton(text: "delete", onPressed: (){}, color: Colors.red,),
            ],
          ),
        ],
      ),
    );
  }
}
