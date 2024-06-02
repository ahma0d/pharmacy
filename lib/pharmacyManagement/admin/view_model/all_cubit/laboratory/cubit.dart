import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/laboratory/all_laboratory_model.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/laboratory/all_order_laboratory.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/laboratory/private_order_model.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/laboratory/states.dart';
import 'package:pharmacy_system/utils/core/constance/api_constance.dart';
import 'package:pharmacy_system/utils/core/constance/token.dart';
import 'package:pharmacy_system/utils/core/server/dio_server.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/fucntion/toast.dart';

class LaboratoryCubit extends Cubit<LaboratoryStates> {
  LaboratoryCubit() : super(LaboratoryInitialState());

  static LaboratoryCubit get(context) => BlocProvider.of(context);

  AllLaboratoryModel? model;
  void getAllLaboratory() async {
    emit(LaboratoryAllLoadingState());
    try {
      final Response response = await DioServer.getData(
        url: ApiConstance.allLaboratory,
        token: tokenData,
      );
      model = AllLaboratoryModel.fromJson(response.data['laboratories']);
      emit(LaboratoryAllSuccessState());
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
      } else if (e.response!.statusCode == 401) {}
    }
  }

  void addLaboratory({
    required String name,
    required String email,
    required String phone,
  }) async {
    emit(LaboratoryAddLoadingState());
    try {
      final Response response = await DioServer.postData(
        url: ApiConstance.addLaboratory,
        token: tokenData,
        data: {"name": name, "email": email, "phone_number": phone},
      );
      emit(LaboratoryAddSuccessState());
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
      } else if (e.response!.statusCode == 401) {}
    }
  }

  void updateLaboratory(
      {required String name,
      required String email,
      required String phone,
      required int id,
      required int runOutLimit,
      required expirationDate,
      context}) async {
    emit(LaboratoryEditLoadingState());
    try {
      final Response response = await DioServer.putData(
        url: ApiConstance.updateLaboratory,
        token: tokenData,
        data: {
          "name": name,
          "email": email,
          "phone_number": phone,
          "laboratoryId": id,
          "runOutLimit": runOutLimit,
          "expirationDate": expirationDate,
        },
      );
      model = AllLaboratoryModel.fromJson(response.data['laboratories']);
      showToast(message: "Edit Success", state: ToastState.Success);
      navigateBack(context: context);
      emit(LaboratoryEditSuccessState());
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
      } else if (e.response!.statusCode == 401) {}
    }
  }

  void deleteLaboratory({required int id}) async {
    try {
      emit(LaboratoryDeleteLoadingState());
      final Response response = await DioServer.deleteData(
        url: ApiConstance.deleteLaboratory,
        data: {
          "laboratoryId": id,
        },
        token: tokenData,
      );
      showToast(message: "Delete Success", state: ToastState.Success);
      emit(LaboratoryDeleteSuccessState());
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
      } else if (e.response!.statusCode == 401) {}
    }
  }

  void rejectOrder({required int id, context}) {
    try {
      DioServer.postData(
        url: ApiConstance.orderReject,
        token: tokenData,
        data: {"orderId": id},
      );
      messageSnackBar(
          context: context,
          text: "Reject Order Success",
          state: ToastState.Success);
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
      } else if (e.response!.statusCode == 401) {}
    }
  }

  void acceptOrder({required int id, context}) {
    try {
      DioServer.postData(
        url: ApiConstance.orderAccept,
        token: tokenData,
        data: {"orderId": id},
      );
      messageSnackBar(
          context: context,
          text: "Accept Order Success",
          state: ToastState.Success);
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
      } else if (e.response!.statusCode == 401) {}
    }
  }

  void deleteOrder({required int id, context}) {
    try {
      DioServer.deleteData(
        url: ApiConstance.orderDelete,
        token: tokenData,
        data: {
          "orderId": id,
        },
      );
      messageSnackBar(
          context: context,
          text: "Delete Order Success",
          state: ToastState.Success);
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
      } else if (e.response!.statusCode == 401) {}
    }
  }

  void addOrder({
    required int id,
    required int quantity,
    required String title,
    required String usage,
    required String description,
  }) async {
    emit(OrderAddLoadingState());
    try {
      final Response response = await DioServer.postData(
        url: ApiConstance.orderAdd,
        token: tokenData,
        data: {
          "laboratoryId": id,
          "title": title,
          "description": description,
          "usage": usage,
          "quantity": quantity,
        },
      );
      emit(OrderAddSuccessState());
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
      } else if (e.response!.statusCode == 401) {}
    }
  }

  List<AllOrderLaboratoryModel> allOrderLaboratory = [];

  void getAllOrdersLaboratory() async {
    emit(AllOrdersLaboratoryLoadingState());
    print("hello 1");
    final Response response = await DioServer.getData(
      url: ApiConstance.allOrder,
      token: tokenData,
    );
    response.data['orders'].forEach((element) {
      allOrderLaboratory.add(AllOrderLaboratoryModel.fromJson(element));
    });
    emit(AllOrdersLaboratorySuccessState());
  }

  PrivateOrderLaboratoryModel? privateOrderLaboratoryModel;
  void getPrivateOrderLaboratory({required int id })async{
    emit(PrivateOrdersLaboratoryLoadingState());
    print("hello 1");
    final Response response = await DioServer.getData(
      url: ApiConstance.privateOrder,
      token: tokenData,
      data: {'orderId' : id,},
    );
    privateOrderLaboratoryModel = PrivateOrderLaboratoryModel.fromJson(response.data['order']);
    emit(PrivateOrdersLaboratorySuccessState());
  }
}
