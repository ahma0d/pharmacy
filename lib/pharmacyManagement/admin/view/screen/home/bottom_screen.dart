import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/home/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/home/states.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
class BottomScreen extends StatelessWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: BottomNavigationBar(
              fixedColor: Colors.white,
              unselectedItemColor: Colors.black,
              backgroundColor: AllColors.appColor,
              type: BottomNavigationBarType.fixed,
              currentIndex: HomeCubit.get(context).currentIndex,
              items: HomeCubit.get(context).bottomItem,
              onTap: (int index) =>
                  HomeCubit.get(context).changeIndexBottom(index),
            ),
          ),
        ),
        body: HomeCubit.get(context).screen[HomeCubit.get(context).currentIndex],
      ),
    );
  }
}
