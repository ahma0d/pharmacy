import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/laboratory/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/laboratory/states.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

import '../../../../../utils/widget/all_app/basic_bottom.dart';
import '../../../../../utils/widget/all_app/text_form_field.dart';

class EditLaboratory extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final int id ;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  EditLaboratory({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    nameController.text = name;
    emailController.text = email;
    phoneController.text = phone;
    return BlocConsumer<LaboratoryCubit, LaboratoryStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: AllColors.appColor,
          title: NormalText(
            text: "Edit name Laboratory",
            colorText: Colors.white,
            sizeText: 20.0,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultFormField(
                controller: nameController,
                type: TextInputType.text,
                label: "Name Laboratory",
                prefixIcon: Icons.drive_file_rename_outline,
                validate: (String? value) {},
              ),
              const SizedBox(
                height: 25.0,
              ),
              DefaultFormField(
                label: "Email Laboratory",
                controller: emailController,
                type: TextInputType.text,
                prefixIcon: Icons.email_outlined,
                validate: (String? value) {},
              ),
              const SizedBox(
                height: 25.0,
              ),
              DefaultFormField(
                label: "Phone Laboratory",
                controller: phoneController,
                prefixIcon: Icons.phone,
                type: TextInputType.text,
                validate: (String? value) {},
              ),
              const SizedBox(
                height: 25.0,
              ),
              BasicBottom(
                text: "Edit  Now",
                colorText: Colors.white,
                onPressed: () {
                  LaboratoryCubit.get(context).updateLaboratory(
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    id: id,
                    runOutLimit: 10,
                    expirationDate: "2023-2-2",
                    context: context,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
