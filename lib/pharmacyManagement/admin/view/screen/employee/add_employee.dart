import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/employee/cubit.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/widget/all_app/basic_bottom.dart';
import 'package:pharmacy_system/utils/widget/all_app/drop_down_menu.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_form_field.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

import '../../../view_model/all_cubit/employee/states.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

enum Gender { male, female }

class _AddEmployeeState extends State<AddEmployee> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  Gender? gender = Gender.male;
  dynamic valueChoose;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AllColors.appColor,
          title: NormalText(
            text: "add employee for pharmacy",
            colorText: Colors.white,
            sizeText: 18.0,
            fontWeight: FontWeight.w600,
          ),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                DefaultFormField(
                  controller: nameController,
                  hint: "Name",
                  prefixIcon: Icons.person,
                  type: TextInputType.name,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "Enter Name Employee";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25.0,
                ),
                DefaultFormField(
                  controller: emailController,
                  hint: "Email",
                  prefixIcon: Icons.email,
                  type: TextInputType.emailAddress,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "Enter Email Employee";
                    }
                    if (!value.contains("@")) {
                      return "You Have to add @ at your email";
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 25.0,
                ),
                DefaultFormField(
                  controller: passwordController,
                  hint: "Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility_off,
                  obscure: true,
                  type: TextInputType.visiblePassword,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "Enter  Password Employee ";
                    }
                    if (value.length < 10) {
                      return "Please your password should by 10 characters or more";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25.0,
                ),
                DefaultFormField(
                  controller: confirmPasswordController,
                  hint: "Confirm Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility_off,
                  obscure: true,
                  type: TextInputType.visiblePassword,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "Enter  Password Employee ";
                    }
                    if (value.length < 10) {
                      return "Please your password should by 10 characters or more";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25.0,
                ),
                DefaultFormField(
                  controller: addressController,
                  hint: "Address",
                  prefixIcon: Icons.location_on,
                  type: TextInputType.visiblePassword,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "Enter Address Employee ";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25.0,
                ),
                DefaultFormField(
                  controller: phoneController,
                  hint: "Phone Number",
                  prefixIcon: Icons.phone,
                  type: TextInputType.phone,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "Enter Email Employee";
                    }
                    if (phoneController.value.text.length < 10) {
                      return "Your Phone Should be 10 Number";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25.0,
                ),
                NormalText(
                  text: "Please choose your gender",
                  sizeText: 18.0,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Icons.person),
                            const SizedBox(
                              width: 10.0,
                            ),
                            NormalText(
                              text: "Male",
                            ),
                            Radio(
                              value: Gender.male,
                              groupValue: gender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  gender = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Icons.woman),
                            const SizedBox(
                              width: 10.0,
                            ),
                            NormalText(text: "Female"),
                            Radio(
                              value: Gender.female,
                              groupValue: gender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  gender = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                NormalText(
                  text: "Please choose role of employee new",
                  sizeText: 18.0,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                DropDownApp(
                  listDrop: const ["Laboratory", "Pharmacist", "New..."],
                  hintText: "Choose role employee",
                  valueChoose: valueChoose,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                BlocConsumer<EmployeeCubit, EmployeeStates>(
                  listener: (context, state) {

                  },
                  builder: (context, state) => BasicBottom(
                    text: "Add Employee",
                    onPressed: () {
                      EmployeeCubit.get(context).addEmployee(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        c_password: confirmPasswordController.text,
                        phone: phoneController.text,
                        gender: gender.toString(),
                        address: addressController.text,
                        role: valueChoose=="Laboratory"? 1 : 2,
                        context: context
                      );
                    },
                    colorText: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
