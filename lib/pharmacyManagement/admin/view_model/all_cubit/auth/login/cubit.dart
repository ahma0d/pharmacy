import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/auth/login.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/auth/verify/verify_screen.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/home/bottom_screen.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/auth/login/state.dart';
import 'package:pharmacy_system/utils/core/constance/api_constance.dart';
import 'package:pharmacy_system/utils/core/constance/token.dart';
import 'package:pharmacy_system/utils/core/save/shared_pref.dart';
import 'package:pharmacy_system/utils/core/server/dio_server.dart';
import 'package:pharmacy_system/utils/fucntion/circle_center.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/fucntion/toast.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool password = true;

  void changePassword() {
    password = !password;
    emit(ChangePasswordState());
  }

  void loginAdmin({
    required String email,
    required String password,
    context,
  }) async {
    try {
      emit(LoginLoadingState());
      final Response response = await DioServer.postData(
        url: ApiConstance.loginUrl,
        data: {
          "email": email,
          "password": password,
        },
      );
      showToast(
        message: "Login Success",
        state: ToastState.Success,
      );
      emit(LoginSuccessState());
      navigateTo(context: context, screen: VerifyScreen());
    } on DioException catch (e) {
      if (e.response!.statusCode == 500) {
        showToast(message: "Server Error", state: ToastState.Error);
      } else if (e.response!.statusCode == 401) {
        showToast(
            message: e.response!.data['message'], state: ToastState.Error);
        emit(LoginSuccessState());
      } else if (e.response!.statusCode == 400) {
        showToast(
            message: e.response!.data['message'], state: ToastState.Error);
        emit(LoginSuccessState());
      }else if (e.response!.statusCode == 429) {
        showToast(
            message: e.response!.statusMessage.toString(), state: ToastState.Error);
        emit(LoginSuccessState());
      }
    }
  }

  LoginModel? loginModel;

  void verifyCode({required code, context}) async{
    emit(LoginVerifyLoadingState());
    try{
      Response response = await DioServer.postData(
        url: ApiConstance.verifyUrl,
        data: {
          "code": code,
        },
      );
      loginModel = LoginModel.fromJson(response.data);
      showToast(message: "Success", state: ToastState.Success);
      emit(LoginVerifySuccessState(loginModel : loginModel!));
    } on DioException catch(e){
      if(e.response!.statusCode ==400 ){
        showToast(message: e.response!.data['message'], state: ToastState.Error);
      }
      if(e.response!.statusCode ==429 ){
        showToast(message: e.response!.data['message'], state: ToastState.Error);
      }
      if(e.response!.statusCode == 500 ){
        showToast(message: e.response!.data['message'], state: ToastState.Error);
      }
      if(e.response!.statusCode == 429){
        showToast(message: e.response!.data['message'], state: ToastState.Error);
      }
    }
  }

  void forgetEmailOne({required String email, context}) async {
    print("hello 1 ");
    try {
      Response response = await DioServer.postData(
        url: ApiConstance.resetPasswordUrl,
        data: {
          "email": email,
        },
      );
      showToast(message: response.data['message'], state: ToastState.Success);
      navigateAndFinish(context: context, screen: VerifyScreen());
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        showToast(
          message: e.response!.data['message'],
          state: ToastState.Error,
        );
      }
    }
  }
}
