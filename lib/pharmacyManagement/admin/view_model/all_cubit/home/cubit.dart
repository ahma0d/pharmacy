import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/company/all_midicine.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/grud/all_grud.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/order/all_order.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/profile/profile_bottom_bar.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/home/states.dart';
import 'package:pharmacy_system/utils/core/constance/api_constance.dart';
import 'package:pharmacy_system/utils/core/constance/token.dart';
import 'package:pharmacy_system/utils/core/server/dio_server.dart';

import '../../../view/screen/business/DashBoard.dart';
import '../../../view/screen/home/home2.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  List<String> title = [
    "Home",
    "Order Pharmacy",
    "Business Pharmacy",
    "Profile",
  ];

  List<Widget> screen = [
     Dashpoard(),
    const HomeUp(),
    const AllOrder(),
    const ProfilBottomBar(),
  ];

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  void changeIndexBottom(int index) {
    currentIndex = index;
    emit(BottomNavBarHomeState());
  }

  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Dashboard",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: "Orders",
    ),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  void listSearch(filter, String? value, context, List old) {
    filter = old
        .where((element) => element.name.toLowerCase().contains(value))
        .toList();
    emit(SearchHomeSuccess());
  }

  List<AllMedicineCompanyModel> allGruds = [];

  void getAllGrudsHome() async {
    emit(AllGurdsLoadingState());
    print("hello 1");
    allGruds = [];
    DioServer.getData(url: ApiConstance.allGruds, token: tokenData)
        .then(
          (value) {
            print(value.data);
            value.data['products'].forEach((element){
              allGruds.add( AllMedicineCompanyModel.fromJson(element)) ;
            });
            print(allGruds[0].name);
          },
        )
        .catchError(
          (error) {
            print(error.toString());
          },
        );
  }
}
