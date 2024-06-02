import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/employee/all_employee.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/employee/edit_profile_employee.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/employee/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/employee/states.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

class ProfileEmployee extends StatelessWidget {
  final AllEmployeeModel model;

  const ProfileEmployee({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeCubit,EmployeeStates>(
      listener: (context,state){},
      builder:(context,state) {
        return  Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 250,
                          width: 360,
                          color: AllColors.appColor,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 62, left: 60),
                            child: NormalText(
                              text: "Profile",
                              sizeText: 30.0,
                              colorText: Colors.white,
                              fontWeight: FontWeight.w400,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 60, left: 300),
                          child: InkWell(
                            onTap: () {
                              navigateTo(
                                context: context,
                                screen: EditProfileEmployee(
                                  name: model.name,
                                  email: model.email,
                                  address: model.address,
                                  gender: model.gender,
                                  id: model.id,
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.edit,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 200, left: 125),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            maxRadius: 70,
                            backgroundImage: AssetImage(
                                "assets/images/1.jpg"),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NormalText(
                        text: "Name",
                        sizeText: 20.0,
                        fontWeight: FontWeight.w600,
                        colorText: AllColors.appColor,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        width: 335,
                        height: 52,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(
                            16.0,
                          ),
                        ),
                        child: NormalText(text:state is EmployeeUpdateSuccessState && model.id == state.model.updateEmployeeModel.id? state.model.updateEmployeeModel.name :model.name),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      NormalText(
                        text: "Email",
                        sizeText: 20.0,
                        fontWeight: FontWeight.w600,
                        colorText: AllColors.appColor,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        width: 335,
                        height: 52,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(
                            16.0,
                          ),
                        ),
                        child: NormalText(text:state is EmployeeUpdateSuccessState&& model.id == state.model.updateEmployeeModel.id? state.model.updateEmployeeModel.email:model.email),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      NormalText(
                        text: "Status Employee",
                        sizeText: 20.0,
                        fontWeight: FontWeight.w600,
                        colorText: AllColors.appColor,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        width: 335,
                        height: 52,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(
                            16.0,
                          ),
                        ),
                        child: NormalText(text: state is EmployeeUpdateSuccessState && model.id == state.model.updateEmployeeModel.id? state.model.updateEmployeeModel.status:model.statu),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      NormalText(
                        text: "Address",
                        sizeText: 20.0,
                        fontWeight: FontWeight.w600,
                        colorText: AllColors.appColor,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        width: 335,
                        height: 52,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(
                            16.0,
                          ),
                        ),
                        child: NormalText(text:state is EmployeeUpdateSuccessState && model.id == state.model.updateEmployeeModel.id? state.model.updateEmployeeModel.address: model.address),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      NormalText(
                        text: "gender",
                        sizeText: 20.0,
                        fontWeight: FontWeight.w600,
                        colorText: AllColors.appColor,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        width: 335,
                        height: 52,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(
                            16.0,
                          ),
                        ),
                        child: NormalText(text:  state is EmployeeUpdateSuccessState && model.id == state.model.updateEmployeeModel.id? state.model.updateEmployeeModel.gender: model.gender),
                      ),
                      const SizedBox(
                        height: 30.0,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

        );
      }
    );
      }
}
