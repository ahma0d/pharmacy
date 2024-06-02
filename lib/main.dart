import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/introduction/introduction_screen.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/auth/login/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/employee/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/home/cubit.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/core/save/shared_pref.dart';
import 'pharmacyManagement/admin/view_model/all_cubit/company/cubit.dart';
import 'pharmacyManagement/admin/view_model/all_cubit/laboratory/cubit.dart';

 Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  Widget widget;
  // ignore: unnecessary_null_comparison

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => CompanyCubit()..getAllCompany()..getAllMedicineInCompany()..getAllCompanyOrder(),
        ),
        BlocProvider(
          create: (context) => EmployeeCubit()..getAllEmployee(),
        ), BlocProvider(
          create: (context) => HomeCubit()..getAllGrudsHome(),
        ),
        BlocProvider(
          create: (context) => LaboratoryCubit()..getAllLaboratory()..getAllOrdersLaboratory(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false ,
        title: 'Pharmacy System Management',
        theme: ThemeData(
          primaryColor:  AllColors.appColor,
        ),
        home:  const IntroductionApp(),
      ),
    );
  }
}
