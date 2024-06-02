import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/company/all_company.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/company/all_midicine.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/company/profile_company.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/company/states.dart';
import 'package:pharmacy_system/utils/core/constance/api_constance.dart';
import 'package:pharmacy_system/utils/core/constance/token.dart';
import 'package:pharmacy_system/utils/core/server/dio_server.dart';
import 'package:pharmacy_system/utils/fucntion/toast.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

import '../../../model/company/all_orders_model.dart';
import '../../../model/company/order_specific_company_model.dart';
import '../../../model/search/search_company_model.dart';
import '../../../model/search/search_product_model.dart';

class CompanyCubit extends Cubit<CompanyStates> {
  CompanyCubit() : super(CompanyInitialState());

  static CompanyCubit get(context) => BlocProvider.of(context);

  List<AllCompanyModel> allCompany = [];

  void getAllCompany() {
    emit(CompanyLoadingState());
    DioServer.getData(url: ApiConstance.allCompany, token: tokenData).then(
      (value) {
        allCompany = [];
        value.data['companies'].forEach((element) {
          allCompany.add(AllCompanyModel.fromJson(element));
          emit(CompanySuccessState());
        });
      },
    ).catchError(
      (error) {
        emit(CompanyErrorState(error: error));
      },
    );
  }

  List<AllMedicineCompanyModel> allMedicineCompany = [];

  void getAllMedicineInCompany() {
    emit(CompanyLoadingState());
    DioServer.getData(url: ApiConstance.allMedicineCompany, token: tokenData)
        .then(
      (value) {
        value.data['products'].forEach((element) {
          allMedicineCompany.add(AllMedicineCompanyModel.fromJson(element));
          emit(CompanySuccessState());
        });
      },
    ).catchError(
      (error) {
        print(error.toString());
        emit(CompanyErrorState(error: error));
      },
    );
  }

  void deleteCompany({required int id, context}) async {
    emit(CompanyDeleteLoadingState());
    final Response response = await DioServer.deleteData(
      url: ApiConstance.deleteCompany,
      token: tokenData,
      data: {
        "companyId": id,
      },
    );
    if (response.statusCode == 200) {
      messageSnackBar(
          context: context,
          text: response.data['message'],
          state: ToastState.Success);
      emit(CompanyDeleteSuccessState());
    }
  }

  void updateCompany({
    required String name,
    required String email,
    required String phone,
    required String type,
    required String address,
    required String updateCompanyId,
  }) async {
    emit(CompanyUpdateLoadingState());
    final response = await DioServer.putData(
      url: ApiConstance.updateCompany,
      token: tokenData,
      data: {
        "name": name,
        "email": email,
        "phone_number": phone,
        "location": address,
        "updateCompanyId": updateCompanyId,
        "type": type
      },
    );
    print(response.data);
    emit(CompanyUpdateSuccessState(allMedicineCompanyModel: AllMedicineCompanyModel.fromJson(response.data)));
  }

  List<SearchCompanyModel> searchCompanyModel = [];

  void searchCompany({required String text}) async {
    emit(SearchCompanyLoadingState());
    try {
      Response response = await DioServer.postData(
        url: ApiConstance.searchCompany,
        token: tokenData,
        data: {"name": text},
      );
      searchCompanyModel = [];
      response.data['searchResult'].forEach((element) {
        searchCompanyModel.add(SearchCompanyModel.fromJson(element));
      });
      emit(SearchCompanySuccessState());
    } on DioException catch (e) {
      if (e.response!.statusCode == 500) {
        Center(
          child: NormalText(
            text: e.response!.data['message'].toString(),
          ),
        );
      }
    }
  }

  List<OrdersCompanyModel> list = [];

  void getAllCompanyOrder() async {
    print("hello 1");
    emit(AllOrdersCompanyLoadingState());
    Response response = await DioServer.getData(
        url: ApiConstance.allOrderCompany, token: tokenData);
    response.data['orders'].forEach((element) {
      list.add(OrdersCompanyModel.fromJson(element));
    });
    print(list[0].totalPrice);
    emit(AllOrdersCompanySuccessState());
  }

  SpecificOrderModel? specificOrderModel;

  void getPrivateOrderId({required int id}) async {
    print("hello 1");
    emit(GetPrivateOrderLoadingState());
    Response response = await DioServer.getData(
        url: ApiConstance.privateOrderByIdCompany,
        token: tokenData,
        data: {
          "orderId": id,
        });
    specificOrderModel = SpecificOrderModel.fromJson(response.data['order']);
    emit(GetPrivateOrderSuccessState());

  }

  void getAllProduct() async {
    emit(AllProductLoadingState());
    Response response = await DioServer.getData(url: "", token: tokenData);
    emit(AllOrdersCompanySuccessState());
  }
   List<SearchProductModel> searchProductModel = [];
  void searchProduct({required String text}) async {
    emit(SearchGrudsCompanyLoadingState());
    try {
      searchProductModel = [];
      Response response = await DioServer.postData(
        url: ApiConstance.searchProduct,
        token: tokenData,
        data: {"name": text},
      );
      response.data['searchResult'].forEach((element) {
        searchProductModel.add(SearchProductModel.fromJson(element));
      });
      emit(SearchGrudsCompanySuccessState());
    } on DioException catch (e) {
      print(e.error);
      if (e.response!.statusCode == 500) {
        Center(
          child: NormalText(
            text: e.response!.data['message'].toString(),
          ),
        );
      }
      else if (e.response!.statusCode == 400) {
        Center(
          child: NormalText(
            text: e.response!.data['message'].toString(),
          ),
        );
      }
    }
  }
}
