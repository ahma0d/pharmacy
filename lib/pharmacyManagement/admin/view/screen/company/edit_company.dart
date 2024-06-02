import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/company/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/company/states.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/widget/all_app/basic_bottom.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_form_field.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

// ignore: must_be_immutable
class EditCompany extends StatelessWidget {
  final String name;

  final String email;

  final String address;

  final String mobile;

  EditCompany({
    super.key,
    required this.name,
    required this.email,
    required this.address,
    required this.mobile,
  });

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController updateCompanyId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyStates>(
        listener: (context, state) {},
        builder: (context, state) {
          nameController.text = name;
          emailController.text = email;
          addressController.text = address;
          phoneController.text = mobile;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AllColors.appColor,
              title: NormalText(
                text: "Edit Details Company",
                colorText: Colors.white,
                sizeText: 20.0,
              ),
            ),
            body: Padding(
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
                      type: TextInputType.name,
                      validate: (String? value) {},
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
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    NormalText(text: "NewCompanyId"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DefaultFormField(
                      controller: updateCompanyId,
                      type: TextInputType.phone,
                      validate: (String? value) {},
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
                      type: TextInputType.streetAddress,
                      validate: (String? value) {},
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    NormalText(text: "Type"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DefaultFormField(
                      controller: typeController,
                      type: TextInputType.text,
                      validate: (String? value) {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    BasicBottom(
                      text: "Edit Now",
                      colorText: Colors.white,
                      sizeText: 20.0,
                      onPressed: ()
                      {
                        CompanyCubit.get(context).updateCompany(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          type: typeController.text,
                          address: addressController.text,
                          updateCompanyId: updateCompanyId.text,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
