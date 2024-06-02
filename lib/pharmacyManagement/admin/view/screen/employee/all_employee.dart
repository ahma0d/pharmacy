import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/employee/add_employee.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/employee/profile_employee.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/search/search_screen.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/company/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/company/states.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/employee/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/employee/states.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/home/cubit.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/icon_button.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';
import 'package:pharmacy_system/utils/widget/employee/one_item_in_all_employee.dart';

class AllEmployee extends StatefulWidget {
  AllEmployee({super.key});

  @override
  State<AllEmployee> createState() => _AllEmployeeState();
}

class _AllEmployeeState extends State<AllEmployee> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.appColor,
        title: NormalText(
          text: "All Employee",
          colorText: Colors.white,
          sizeText: 20.0,
        ),
        centerTitle: true,
        actions: [
          DefaultIconButton(
            iconData: Icons.add,
            onPressed: () {
              navigateTo(
                context: context,
                screen: const AddEmployee(),
              );
            },
          ),
          const SizedBox(width: 6.0,),
          DefaultIconButton(
            iconData: Icons.search,
            onPressed: () {
              navigateTo(
                context: context,
                screen: SearchScreen(),
              );
            },
          ),
          const SizedBox(width: 5.0,),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scrollUp,
        backgroundColor: AllColors.appColor,
        child:  const Icon(Icons.arrow_upward),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<EmployeeCubit, EmployeeStates>(
               listener: (context , state){
                 // if(state is AddEmployeeSuccessState){
                 //   EmployeeCubit.get(context).getAllEmployee();
                 // }
               },
              builder: (context, state) => ConditionalBuilder(
                condition:
                    EmployeeCubit.get(context).allEmployeeList.isNotEmpty,
                builder: (context) => Expanded(
                  child: ListView.separated(
                    controller: controller,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        navigateTo(
                          context: context,
                          screen: ProfileEmployee(
                            model: EmployeeCubit.get(context)
                                .allEmployeeList[index],
                          ),
                        );
                      },
                      child: OneItemEmployee(
                          employeeModel: EmployeeCubit.get(context)
                              .allEmployeeList[index]),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15.0,
                    ),
                    itemCount: state is AddEmployeeSuccessState?  EmployeeCubit.get(context).itemCount : EmployeeCubit.get(context).itemCount,
                  ),
                ),
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void scrollUp() {
    final double start = 0;
    controller.jumpTo(start);
    controller.animateTo(start,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

  void scrollDown() {
    final double end = controller.position.maxScrollExtent;
    controller.animateTo(end,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
    controller.jumpTo(end);
  }

  void init() {
    controller.addListener(listnerControlling);
  }

  void listnerControlling() {
    if (controller.position.atEdge) {
      final isStop = controller.position.pixels == 0;
      if (isStop) {
        //   Utils.showSnackBar(context , text)
      }
    }
  }
}
