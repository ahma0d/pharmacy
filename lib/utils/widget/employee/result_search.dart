import 'package:flutter/material.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/employee/all_employee.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/search/search_employee_model.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/employee/profile_employee.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/widget/all_app/basic_bottom.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

class ResultSearch extends StatelessWidget {
  final AllEmployeeModel employeeModel;
  const ResultSearch({super.key, required this.employeeModel});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: 360.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    children: [
                       const Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        child: CircleAvatar(
                          maxRadius: 35,
                          backgroundImage:
                          AssetImage("assets/images/1.jpg"),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 5),
                            child: NormalText(
                              text: employeeModel.name.toString(),
                              sizeText: 22.0,
                              fontWeight: FontWeight.bold,
                              colorText: AllColors.appColor,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: NormalText(text: employeeModel.email.toString() ,colorText: Colors.grey,),
                          ),
                          const SizedBox(height: 5.0,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: NormalText(text: employeeModel.address.toString(), colorText: Colors.grey,),
                          ),
                          const SizedBox(height: 5.0,),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                NormalText(text: "score"),
                                const SizedBox(width: 20.0,),
                                NormalText(text: employeeModel.id.toString() ,colorText: Colors.grey,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Divider(color: Colors.grey, endIndent: 20, indent: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NormalText(
                      text: employeeModel.id.toString(),
                      colorText: Colors.grey,
                      sizeText: 16.0,
                      fontWeight: FontWeight.w500,
                    ),

                    const SizedBox(
                      width: 25,
                    ),
                    NormalText(
                      text:employeeModel.gender.toString() ,
                      sizeText: 16,
                      colorText: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Icon(Icons.circle, color: Colors.green, size: 20),
                    const SizedBox(
                      width: 5,
                    ),
                    NormalText(
                      text: employeeModel.statu.toString(),
                      sizeText: 16.0,
                      colorText: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 140,
                      height: 44,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color(0xff1C208F),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text("Cancel",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12)),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    BasicBottom(
                      text: "Details",
                      onPressed: () {},
                      width: 140,
                      height: 40,
                      colorText: Colors.white,
                      borderRadius: 10.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
