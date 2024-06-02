import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/auth/add_admain.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/auth/login/login_screen.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/auth/add_admain/state.dart';
import 'package:pharmacy_system/utils/core/constance/api_constance.dart';
import 'package:pharmacy_system/utils/core/server/dio_server.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/fucntion/toast.dart';

class AddAdminCubit extends Cubit<AdminStates> {
  AddAdminCubit() : super(AuthInitialState());

  static AddAdminCubit get(context) => BlocProvider.of(context);

  RegisterModel? model;

  // ignore: non_constant_identifier_names
  void RegisterAdmin({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String gender,
    required String address,
    // ignore: non_constant_identifier_names
    required String phone_number,
    context,
  }) async {
    try {
      Response response1 = await DioServer.postData(
        url: ApiConstance.registerUrl,
        data: {
          "name": name,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
          "phone_number": phone_number,
          "gender": gender,
          "address": address,
        },
      );

      model = RegisterModel.fromJson(response1.data);
      if(model!.message == "Succeed"){
        showToast(message: "Register Success", state: ToastState.Success);
        navigateAndFinish(context: context, screen: LoginScreen());
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        showToast(message: e.response!.data['message'], state: ToastState.Error);

      }
      if (e.response!.statusCode == 400) {
        showToast(message: e.response!.data['message'], state: ToastState.Error);

      }
    }
  }
}
