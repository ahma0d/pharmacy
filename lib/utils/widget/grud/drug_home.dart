import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/company/all_midicine.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/grud/details_grud.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/home/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/home/states.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

// ignore: must_be_immutable
class DrugHome extends StatelessWidget {
  DrugHome({Key? key, required this.index , required this.allMedicineCompanyModel}) : super(key: key);
  Color color = AllColors.appColor;
  final int index;
 final AllMedicineCompanyModel allMedicineCompanyModel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        navigateTo(
          context: context,
          screen: DetailsGruds(
            allMedicineCompanyModel: allMedicineCompanyModel,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        margin: EdgeInsets.only(left: size.height / 70, top: size.height / 90),
        height: size.height * .24,
        width: size.height * .16,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(
                'assets/images/m6.jpg',
              ),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.1),
        ),
        child: Stack(children: [
          BlocConsumer<HomeCubit, HomeStates>(
            listener: (context, state) {},
            builder: (context, state) => Positioned(
              bottom: 10,
              right: 6,
              left: 8,
              child: NormalText(
                text:
                    HomeCubit.get(context).allGruds[index].name.toString(),
                sizeText: 14,
                maxLine: 1,
                fontWeight: FontWeight.w400,
                colorText: Colors.black,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
