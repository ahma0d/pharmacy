import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/employee/all_employee.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/employee/profile_employee.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/employee/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/employee/states.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/basic_bottom.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

class OneItemEmployee extends StatelessWidget {
  final AllEmployeeModel employeeModel;

  const OneItemEmployee({super.key, required this.employeeModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeCubit, EmployeeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.only(left: 0.0, top: 10.0, bottom: 10.0),
            width: 365,
            height: 200.95,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(22.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20.0,),
                Container(
                  width: 120,
                  height: 180.95,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(12.0) ,
                  color: Colors.transparent,
                    image: const DecorationImage(
                      image: AssetImage("assets/images/1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 20.0,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NormalText(
                        text: state is EmployeeUpdateSuccessState &&
                                employeeModel.id ==
                                    state.model.updateEmployeeModel.id
                            ? state.model.updateEmployeeModel.name
                            : employeeModel.name,
                        sizeText: 20.0,
                        fontWeight: FontWeight.w900,
                        colorText: AllColors.appColor,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      NormalText(
                        text: state is EmployeeUpdateSuccessState &&
                                employeeModel.id ==
                                    state.model.updateEmployeeModel.id
                            ? state.model.updateEmployeeModel.address
                            : employeeModel.address,
                        sizeText: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      NormalText(
                        colorText: Colors.grey,
                        text: state is EmployeeUpdateSuccessState &&
                                employeeModel.id ==
                                    state.model.updateEmployeeModel.id
                            ?  state.model.updateEmployeeModel.gender
                            : employeeModel.gender,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      NormalText(
                        text: state is EmployeeUpdateSuccessState &&
                                employeeModel.id ==
                                    state.model.updateEmployeeModel.id
                            ? state.model.updateEmployeeModel.email
                            : employeeModel.email,
                        sizeText: 16.0,
                        fontWeight: FontWeight.w400,
                        maxLine: 1,
                        colorText: Colors.grey,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      NormalText(
                        text: state is EmployeeUpdateSuccessState &&
                                employeeModel.id ==
                                    state.model.updateEmployeeModel.id
                            ? state.model.updatedRoleModel.salary
                            : "",
                        colorText: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
