import 'package:flutter/material.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/company/all_company.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/company/details_company.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

class Item extends StatelessWidget {
  final AllCompanyModel allCompanyModel;

  const Item({super.key, required this.allCompanyModel});

  @override
  Widget build(BuildContext context) {
    return  Card(
        color: const Color(0xffE4F9F5),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                width: 120.0,
                height: 140.0,
                decoration: BoxDecoration(
                  color: const Color(0xffE4F9F5),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 0.4),
                  image: const DecorationImage(
                    opacity: 0.5,
                    image: AssetImage("assets/images/m6.jpg",),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: SizedBox(
                  height: 120.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: NormalText(
                          text: allCompanyModel.name,
                          heightText: 1.5,
                          colorText: Colors.black,
                          textOverflow: TextOverflow.ellipsis,
                          maxLine: 3,
                          sizeText: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      NormalText(
                        text: allCompanyModel.email,
                        colorText: Colors.black,
                        maxLine: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      NormalText(
                        text: allCompanyModel.phone,
                        colorText: Colors.black,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      NormalText(
                        text: allCompanyModel.location,
                        colorText: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

    );
  }
}
