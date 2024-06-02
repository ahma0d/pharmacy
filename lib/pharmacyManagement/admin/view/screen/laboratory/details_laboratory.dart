import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_botton.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';
import 'package:pharmacy_system/utils/widget/laboratory/item_one_all_orders.dart';
import '../../../../../utils/widget/all_app/basic_bottom.dart';
import '../../../../../utils/widget/all_app/menu_item.dart';
import '../../../view_model/all_cubit/company/cubit.dart';
import '../../../view_model/all_cubit/company/states.dart';

class DetailsLaboratory extends StatelessWidget {
  const DetailsLaboratory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AllColors.appColor,
        title: NormalText(
          text: "name Laboratory",
          sizeText: 20.0,
          colorText: Colors.white,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20.000,
          ),
          _tabSection(context),
        ],
      ),
    );
  }

  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              tabs: [
                Tab(
                  child: Align(
                      alignment: Alignment.center,
                      child: NormalText(text: "Rows")),
                ),
                Tab(
                  child: Align(
                      alignment: Alignment.center,
                      child: NormalText(text: "Products")),
                ),
                Tab(
                  child: Align(
                      alignment: Alignment.center,
                      child: NormalText(text: "Orders")),
                ),
              ],
            ),
          ),
          SizedBox(
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
                        value: "Noor ",
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
                        value: "nnn@gmail.com",
                        icon: Icons.email,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      MenuItem(
                        type: "Address : ",
                        value: "",
                        icon: Icons.location_on,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      MenuItem(
                        type: "Phone Number : ",
                        value: "155848",
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
                                // navigateTo(
                                //   context: context,
                                //   screen: EditCompany(
                                //     name: model.name,
                                //     email: model.email,
                                //     address: model.location,
                                //     mobile: model.phone,
                                //   ),
                                // );
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
                                    // CompanyCubit.get(context).deleteCompany(
                                    //     id: model.id, context: context);
                                    // navigateBack(context: context);
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
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 20,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 250,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 100,
                              width: 104,
                              decoration: BoxDecoration(
                                  color: const Color(0xffEEEEFF),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 0),
                                      child: CircleAvatar(
                                        maxRadius: 45,
                                        // child: Image(
                                        //   image: AssetImage(todays[index]),
                                        // ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    NormalText(
                                      text: "Name Products",
                                      fontWeight: FontWeight.w600,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    NormalText(
                                      text: "amount",
                                      sizeText: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    NormalText(text: "User"),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 15.0),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index)
                    {
                      return const OneItemOrderLaboratory();
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20.0,
                    ),
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
