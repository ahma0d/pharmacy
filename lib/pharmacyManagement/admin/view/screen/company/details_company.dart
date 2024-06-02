import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/company/all_company.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/company/edit_company.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/grud/details_grud.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/company/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/company/states.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/basic_bottom.dart';
import 'package:pharmacy_system/utils/widget/all_app/icon_button.dart';
import 'package:pharmacy_system/utils/widget/all_app/menu_item.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

class DetailsCompany extends StatelessWidget {
  final AllCompanyModel model;

  const DetailsCompany({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: DefaultIconButton(
                      iconData: Icons.arrow_back_ios_new,
                      iconColor: Colors.black,
                      onPressed: () {
                        navigateBack(context: context);
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text("Details Company",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        )),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Icon(Icons.notifications_none,
                        size: 30, color: Color(0xff475467)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              _tabSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabSection(BuildContext context) {
    return BlocConsumer<CompanyCubit,CompanyStates>(
      listener: (context,state){},
      builder:(context,state){
        var cubit = CompanyCubit.get(context);
        return DefaultTabController(
          length: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 52,
                width: 335,
                decoration: BoxDecoration(
                  color: AllColors.appColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TabBar(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  unselectedLabelColor: const Color(0xff8E90C7),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), color: Colors.white),
                  tabs: const [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("All information",
                            style: TextStyle(
                              color: Color(0xff8E90C7),
                            )),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Company Product",
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 650,
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Align(
                          //   alignment: Alignment.topCenter,
                          //   child: Image.asset(
                          //     'assets/images/open.png',
                          //     width: 200,
                          //     height: 200,
                          //   ),
                          // ),
                          const SizedBox(
                            height: 80.0,
                          ),
                          MenuItem(
                            type: "Name Company : ",
                            value: state is CompanyUpdateSuccessState && state.allMedicineCompanyModel.id == model.id ? state.allMedicineCompanyModel.name.toString() : model.name ,
                            icon: Icons.person,
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          MenuItem(
                            type: "details Company : ",
                            value: "Medical Company",
                            icon: Icons.supervised_user_circle,
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          MenuItem(
                            type: "Email Company : ",
                            value: model.email,
                            icon: Icons.email,
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          MenuItem(
                            type: "Address : ",
                            value: model.location,
                            icon: Icons.location_on,
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          MenuItem(
                            type: "Phone Number : ",
                            value: model.phone,
                            icon: Icons.phone,
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          MenuItem(
                            type: "Fax : ",
                            value: "011 - 9884",
                            icon: Icons.phonelink,
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          MenuItem(
                            type: "Account",
                            value: "150      see details ",
                            icon: Icons.business,
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: BasicBottom(
                                  text: "Edit",
                                  onPressed: () {
                                    navigateTo(
                                      context: context,
                                      screen: EditCompany(
                                        name: model.name,
                                        email: model.email,
                                        address: model.location,
                                        mobile: model.phone,
                                      ),
                                    );
                                  },
                                  colorContainer: Colors.amber,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              BlocConsumer<CompanyCubit, CompanyStates>(
                                listener: (context, state) {},
                                builder: (context, state) => ConditionalBuilder(
                                  condition: state is! CompanyDeleteLoadingState,
                                  builder: (context) => Expanded(
                                    child: BasicBottom(
                                      colorContainer: Colors.red,
                                      text: "Delete",
                                      onPressed: () {
                                        CompanyCubit.get(context).deleteCompany(
                                            id: model.id, context: context);
                                        navigateBack(context: context);
                                      },
                                    ),
                                  ),
                                  fallback: (context) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                              //BasicBottom(text: "Edit", onPressed: (){},width: 80,),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12.0),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: CompanyCubit.get(context)
                                  .allMedicineCompany
                                  .length,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 200,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    navigateTo(
                                      context: context,
                                      screen: DetailsGruds(
                                        allMedicineCompanyModel:
                                        CompanyCubit.get(context)
                                            .allMedicineCompany[index],
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 104,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffEEEEFF),
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 0),
                                            child: CircleAvatar(
                                              maxRadius: 35,
                                              backgroundImage: AssetImage(
                                                  "assets/images/m6.jpg"),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              CompanyCubit.get(context)
                                                  .allMedicineCompany[index]
                                                  .name!,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            CompanyCubit.get(context)
                                                .allMedicineCompany[index]
                                                .manufactorerName!,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          NormalText(
                                            text: CompanyCubit.get(context)
                                                .allMedicineCompany[index]
                                                .typeOneProduct!
                                                .name,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
