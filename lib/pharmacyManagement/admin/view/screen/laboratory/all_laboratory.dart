import 'package:flutter/material.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/laboratory/add_laboratory.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/laboratory/cubit.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';
import 'package:pharmacy_system/utils/widget/laboratory/all_laboratory.dart';

import 'details_laboratory.dart';

class MyLaboratory extends StatelessWidget {
  const MyLaboratory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateTo(context: context, screen: AddLaboratory());
        },
        backgroundColor: AllColors.appColor,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: AllColors.appColor,
        title: NormalText(
          text: "All Laboratory",
          sizeText: 20.0,
          colorText: Colors.white,
        ),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              navigateTo(
                context: context,
                screen: const DetailsLaboratory(),
              );
            },
            child: const AllLaboratoryWidget(),
          );
        },
        separatorBuilder: (context, index) => const Divider(
          thickness: 1.4,
        ),
        itemCount: 1,
      ),
    );
  }
}
