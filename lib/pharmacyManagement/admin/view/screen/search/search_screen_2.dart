import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/home/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/home/states.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/widget/all_app/search_medicine.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_botton.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

// ignore: must_be_immutable
class SearchScreen2 extends StatefulWidget {
  SearchScreen2({super.key});

  @override
  State<SearchScreen2> createState() => _SearchScreen2State();
}

class _SearchScreen2State extends State<SearchScreen2> {
  TextEditingController searchController = TextEditingController();

  List filter = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.appColor,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
          width: 260.0,
          height: 40.0,
          child: TextFormField(
            controller: searchController,
            onChanged: (String? value) {
              setState(() {
                filter = HomeCubit.get(context)
                    .allGruds
                    .where((element) =>
                        element.name!.toLowerCase().contains(value!))
                    .toList();
              });
            },
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Search about Medicine",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        actions: [
          DefaultTextButton(
            text: "Cancel",
            color: Colors.white,
            onPressed: () {
              searchController.clear();
            },
          ),
          const SizedBox(
            width: 5.0,
          ),
        ],
      ),
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) => filter.isNotEmpty
            ? ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => SearchMedicine(
                  allGrud: filter[index],
                ),
                separatorBuilder: (context, index) => const Divider(
                  height: 2.8,
                  thickness: 1.5,
                ),
                itemCount: filter.length,
              )
            : Center(
                child: NormalText(
                  text: "Not Result Found",
                  fontWeight: FontWeight.w800,
                  sizeText: 20.0,
                ),
              ),
      ),
    );
  }
}
