import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/auth/verify/verify_screen.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/auth/login/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/auth/login/state.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/basic_bottom.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_form_field.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';
class ForgetPassword extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
   var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.appColor,
        centerTitle: true,
        title: NormalText(
          text: "Forget Password",
          colorText: Colors.white,
          sizeText: 20.0,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key:formKey ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 400,
                  child: SvgPicture.asset('assets/images/reset.svg'),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text("Email"),
                const SizedBox(
                  height: 15.0,
                ),
                DefaultFormField(
                  prefixIcon: Icons.email_outlined,
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "Enter Your Name Pharmayc";
                    }
                    else if (!value.contains('@')){
                      return "Please input @ in your email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25.0,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                BlocConsumer<LoginCubit , LoginStates>(
                  listener: (context ,state){},
                  builder: (context ,state) =>  BasicBottom(
                    text: "Next Verify",
                    colorText: Colors.white,
                    onPressed: () {
                      if(formKey.currentState!.validate()){

                      LoginCubit.get(context).forgetEmailOne(
                        email: emailController.text,
                        context: context,
                      );
                      }
                    },
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
