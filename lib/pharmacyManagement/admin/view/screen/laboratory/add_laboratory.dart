import 'package:flutter/material.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/widget/all_app/basic_bottom.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_form_field.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

class AddLaboratory extends StatelessWidget {
  AddLaboratory({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.appColor,
        title: NormalText(
          text: "Add Laboratory",
          sizeText: 20.0,
          colorText: Colors.white,
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
              text: "Add Laboratory Now",
              colorText: Colors.white,
              onPressed: () {
                // access to api add laboratory
              },
            ),
          ],
        ),
      ),
    );
  }
}
