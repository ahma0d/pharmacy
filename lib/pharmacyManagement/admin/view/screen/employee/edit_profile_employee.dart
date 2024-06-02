import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/employee/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/employee/states.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/basic_bottom.dart';
import 'package:pharmacy_system/utils/widget/all_app/icon_button.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_form_field.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

// ignore: must_be_immutable
class EditProfileEmployee extends StatefulWidget {
  final String name;

  final String email;

  final String address;

  final String gender;

  final int id;

  EditProfileEmployee({
    super.key,
    required this.name,
    required this.email,
    required this.address,
    required this.gender,
    required this.id,
  });

  @override
  State<EditProfileEmployee> createState() => _EditProfileEmployeeState();
}

class _EditProfileEmployeeState extends State<EditProfileEmployee> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  TextEditingController salaryController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController c_passwordController = TextEditingController();

  String? valueChoose;

  @override
  Widget build(BuildContext context) {
    emailController.text = widget.email;
    nameController.text = widget.name;
    phoneController.text = "0933548550";
    addressController.text = widget.address;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(top: 50.0),
                      height: 250,
                      width: 360,
                      color: AllColors.appColor,
                      child: DefaultIconButton(
                        iconData: Icons.arrow_back,
                        onPressed: () {
                          navigateBack(context: context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 62, left: 60),
                      child: NormalText(
                        text: "Edit Profile",
                        sizeText: 20.0,
                        fontWeight: FontWeight.w500,
                        colorText: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 200, left: 125),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 80,
                        backgroundImage: AssetImage("assets/images/open.png"),
                      ),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(text: "Name"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DefaultFormField(
                      controller: nameController,
                      type: TextInputType.text,
                      validate: (String? value) {},
                      hint: "Name",
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    NormalText(
                      text: "Email",
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DefaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {},
                      hint: "Email",
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    NormalText(text: "Password"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DefaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (String? value) {},
                      hint: "Password",
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    NormalText(text: "ConfirmPassword"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DefaultFormField(
                      controller: c_passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (String? value) {},
                      hint: "ConfirmPassword",
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    NormalText(text: "Gender"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 45.0, right: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: DropdownButton(
                        hint: const Text("choose Gender"),
                        onChanged: (String? value) {
                          setState(() {
                            valueChoose = value;
                          });
                        },
                        underline: const SizedBox(
                          width: 0.0,
                          height: 0.0,
                        ),
                        isExpanded: true,
                        value: valueChoose ?? widget.gender,
                        style: const TextStyle(color: Colors.black),
                        items: ['male', 'female']
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    NormalText(text: "Mobile Number"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DefaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      validate: (String? value) {},
                      hint: "phone number",
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    NormalText(text: "Address"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DefaultFormField(
                      controller: addressController,
                      type: TextInputType.text,
                      validate: (String? value) {},
                      hint: "Address",
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    NormalText(text: "Salary"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DefaultFormField(
                      controller: salaryController,
                      type: TextInputType.number,
                      validate: (String? value) {},
                      hint: "Salary",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    BlocConsumer<EmployeeCubit, EmployeeStates>(
                      listener: (context, state) {},
                      builder: (context, state) => BasicBottom(
                        text: "Edit Now",
                        colorText: Colors.white,
                        sizeText: 20.0,
                        onPressed: () {
                          EmployeeCubit.get(context).updateEmployee(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            c_password: c_passwordController.text,
                            id: widget.id,
                            address: addressController.text,
                            phone: phoneController.text,
                            gender: valueChoose.toString(),
                            salary: salaryController.text,
                            employeeMonth: true,
                            context: context,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
