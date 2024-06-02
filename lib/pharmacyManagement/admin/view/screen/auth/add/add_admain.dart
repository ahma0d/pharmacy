import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/auth/add_admain/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/auth/add_admain/state.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/widget/all_app/basic_bottom.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_form_field.dart';

class AdminRegister extends StatefulWidget {
  const AdminRegister({super.key});

  @override
  State<AdminRegister> createState() => _AdminRegisterState();
}

class _AdminRegisterState extends State<AdminRegister> {
  int _index = 0;
  var formKey1 = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController c_passwordController = TextEditingController();
  TextEditingController namePharmacyController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  List<Step> listStep() =>
      [
        Step(
          title: const Text("Account"),
          content: Step1Widget(
            formKey: formKey1,
            c_passwordController: c_passwordController,
            emailController: emailController,
            nameController: nameController,
            passwordController: passwordController,
          ),
          isActive: _index > 0 ? true : false,
        ),
        Step(
          title: const Text("Address"),
          content: AdressScreen(
            namePharmacyController: namePharmacyController,
            phoneController: phoneController,
            formKey: formKey2,
            addressController: addressController,
          ),
          isActive: _index > 1 ? true : false,
        ),
        const Step(
            title: Text("Register"),
            content: FinishRegisterScreen(),
            state: StepState.complete),
      ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(
            top: 20.0,
          ),
          child: Form(
            child: Column(
              children: [
                Expanded(
                  child: Stepper(
                    controlsBuilder: (context, ControlsDetails details) {
                      return Row(
                        children: [
                          Expanded(
                            child: BasicBottom(
                              height: 40.0,
                              colorContainer: AllColors.greenColor,
                              borderRadius: 8.0,
                              text: "Continue",
                              onPressed: () {
                                setState(() {
                                  if (_index == 0) {
                                    if (formKey1.currentState!.validate()) {
                                      _index += 1;
                                    }
                                  }
                                  if (_index == 1) {
                                    if (formKey2.currentState!.validate()) {
                                      _index += 1;
                                    }
                                  }
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: BasicBottom(
                              height: 40.0,
                              colorContainer: AllColors.redColor,
                              borderRadius: 8.0,
                              text: _index < listStep().length - 1
                                  ? "Back"
                                  : "Cancel",
                              onPressed: () {
                                setState(() {
                                  if (_index == 2) {
                                    _index = 0;
                                  }
                                  if (_index == 0) {
                                    return;
                                  }
                                  if (_index < listStep().length - 1) {
                                    _index -= 1;
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      );
                    },
                    // key: formKey,
                    elevation: 0.0,
                    physics: const BouncingScrollPhysics(),
                    // margin: const EdgeInsets.all(5.0),
                    currentStep: _index,
                    onStepCancel: () {
                      if (_index == 0) {
                        return;
                      }
                      setState(() {
                        _index -= 1;
                      });
                    },
                    onStepTapped: (int index) {
                      setState(() {
                        _index = index;
                      });
                    },
                    type: StepperType.vertical,
                    steps: listStep(),
                  ),
                ),
                if(_index == 2)

                  BlocProvider<AddAdminCubit>(
                    create: (context) => AddAdminCubit(),
                    child: BlocConsumer<AddAdminCubit, AdminStates>(
                      listener: (context, state) {},
                      builder: (context, state) =>
                          BasicBottom(
                            text: "Add Admin",
                            colorText: Colors.white,
                            //height: 100.0,
                            onPressed: () {

                              AddAdminCubit.get(context).RegisterAdmin(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                confirmPassword: c_passwordController.text,
                                gender: "male",
                                address: addressController.text,
                                phone_number: phoneController.text,
                                context: context
                              );
                            },
                          ),
                    ),
                  ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Step1Widget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController c_passwordController;
  final Key formKey;

  const Step1Widget({
    super.key,
    required this.emailController,
    required this.nameController,
    required this.passwordController,
    required this.c_passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25.0,
              ),
              const Text("Name"),
              const SizedBox(
                height: 15.0,
              ),
              DefaultFormField(
                controller: nameController,

                type: TextInputType.text,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return "Enter Your Name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Text("Email"),
              const SizedBox(
                height: 15.0,
              ),
              DefaultFormField(
                controller: emailController,
                type: TextInputType.emailAddress,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return "Enter Your Email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Text("Password"),
              const SizedBox(
                height: 15.0,
              ),
              DefaultFormField(
                controller: passwordController,
                obscure: true,
                type: TextInputType.visiblePassword,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return "Enter Your Password";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30.0,),
              const Text("Confirm Password"),
              const SizedBox(
                height: 15.0,
              ),
              DefaultFormField(
                controller: c_passwordController,
                obscure: true,
                type: TextInputType.visiblePassword,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return " Confirm Your Password";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdressScreen extends StatelessWidget {
  final TextEditingController namePharmacyController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final Key formKey;

  const AdressScreen({
    super.key,
    required this.namePharmacyController,
    required this.phoneController,
    required this.addressController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const Text("Name Pharmacy"),
              const SizedBox(
                height: 15.0,
              ),
              DefaultFormField(
                controller: namePharmacyController,
                type: TextInputType.text,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return "Enter Your Name Pharmayc";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Text("Address"),
              const SizedBox(
                height: 15.0,
              ),
              DefaultFormField(
                controller: addressController,
                type: TextInputType.text,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return "Enter Your Location";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Text("Phone Number"),
              const SizedBox(
                height: 15.0,
              ),
              DefaultFormField(
                controller: phoneController,
                type: TextInputType.phone,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return "Enter Your Phone";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25.0,),
            ],
          ),
        ),
      ),
    );
  }
}

class FinishRegisterScreen extends StatelessWidget {
  const FinishRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 180.0,
            backgroundColor: AllColors.appColor,
          ),
          Positioned(
            top: 280.0,
            left: 200.0,
            bottom: 30.0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt_rounded,
                size: 40.0,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
