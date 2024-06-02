import 'package:pharmacy_system/pharmacyManagement/admin/model/company/profile_company.dart';

import '../../../model/company/all_midicine.dart';

abstract class CompanyStates {}

class CompanyInitialState extends CompanyStates {}

// _______________________________________ get All Company
class CompanyLoadingState extends CompanyStates {}

class CompanySuccessState extends CompanyStates {}

class CompanyErrorState extends CompanyStates {
  final String error;

  CompanyErrorState({required this.error});
}

//....................................... profile company
class ProfileCompanyLoadingState extends CompanyStates {}

class ProfileCompanySuccessState extends CompanyStates {
  final ProfileCompanyModel profileCompanyModel;

  ProfileCompanySuccessState({
    required this.profileCompanyModel,
  });
}

class ProfileCompanyErrorState extends CompanyStates {
  final String error;

  ProfileCompanyErrorState({required this.error});
}
//______________________________________ deleteCompany

class CompanyDeleteLoadingState extends CompanyStates {}

class CompanyDeleteSuccessState extends CompanyStates {}

class CompanyDeleteErrorState extends CompanyStates {
  final String error;

  CompanyDeleteErrorState({required this.error});
}

// ______________________________________updateCompany

class CompanyUpdateLoadingState extends CompanyStates {}

class CompanyUpdateSuccessState extends CompanyStates {
  final AllMedicineCompanyModel allMedicineCompanyModel;


  CompanyUpdateSuccessState({required this.allMedicineCompanyModel} );}

class CompanyUpdateErrorState extends CompanyStates {
  final String error;

  CompanyUpdateErrorState({required this.error});
}

// ________________________________________________________ allOrdersCompany


class AllOrdersCompanyLoadingState extends CompanyStates {}

class AllOrdersCompanySuccessState extends CompanyStates {}


class AllProductLoadingState extends CompanyStates {}

class AllProductSuccessState extends CompanyStates {}

class SearchCompanyLoadingState extends CompanyStates {}

class SearchCompanySuccessState extends CompanyStates {}

class SearchGrudsCompanyLoadingState extends CompanyStates {}

class SearchGrudsCompanySuccessState extends CompanyStates {}

class GetPrivateOrderLoadingState extends CompanyStates {}

class GetPrivateOrderSuccessState extends CompanyStates {}