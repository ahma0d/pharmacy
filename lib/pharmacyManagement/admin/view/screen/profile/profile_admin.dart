import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/auth/login/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/auth/login/state.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/widget/all_app/basic_bottom.dart';
import 'package:pharmacy_system/utils/widget/all_app/icon_button.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_form_field.dart';

class ProfileAdmin extends StatefulWidget {
  ProfileAdmin({Key? key}) : super(key: key);

  @override
  State<ProfileAdmin> createState() => _ProfileAdminState();
}

class _ProfileAdminState extends State<ProfileAdmin> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  bool reading = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context).loginModel!;
          nameController.text = cubit.employeeModel.name;
          emailController.text = cubit.employeeModel.email;
          addressController.text = cubit.employeeModel.address;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AllColors.appColor,
              title: const Text("Admin Account "),
            ),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 80),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Color(0xffE4F9F5),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: const CircleAvatar(
                              maxRadius: 90.0,
                              minRadius: 50,
                              backgroundImage: AssetImage(
                                "assets/images/1.jpg",
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          DefaultFormField(
                            read: reading,
                             autoFocus: reading == true ?  false :true,
                            label: "Name Admin",
                            controller: nameController,
                            type: TextInputType.name,
                            validate: (String? value) {},
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          DefaultFormField(
                            read: reading,
                            label: "Email Admin",
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String? value) {},
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          DefaultFormField(
                            read: reading,
                            label: "Address Admin",
                            controller: addressController,
                            type: TextInputType.streetAddress,
                            validate: (String? value) {},
                          ),
                          const SizedBox(height: 20.0,),
                          if (reading == false) BasicBottom(
                            text: "Edit Details Admin",
                            onPressed: () {},
                            colorText: Colors.white,
                          ) else Container(),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 50,
                      child: DefaultIconButton(
                        iconData: Icons.edit,
                        onPressed: () {
                          setState(() {
                            reading = false;
                          });
                        },
                      )),
                  Positioned(
                    top: 100,
                    left: 320,
                    child: DefaultIconButton(
                      iconData: Icons.edit,
                      onPressed: () {},
                      iconColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
