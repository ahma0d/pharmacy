class ApiConstance {

 static  String baseUrl = "http://192.168.92.254:7000/api";
 // ____________________________________ Auth
 static  String loginUrl = '$baseUrl/auth/login';
 static  String verifyUrl = '$baseUrl/auth/verify-login';
 static  String registerUrl = "$baseUrl/auth/register";
 static  String resetPasswordUrl = "$baseUrl/auth/reset-password";

 // _____________________________________ Company

  static String allCompany = "$baseUrl/company/display-all";

  static String allMedicineCompany = "$baseUrl/company/products/display-all";

  static String profileCompany = "$baseUrl/profile";

  static String updateCompany = "$baseUrl/company/update-company";

  static String deleteCompany = "$baseUrl/company/delete-company";

  static String allGruds = "$baseUrl/company/products/display-all";

  static String searchCompany = "$baseUrl/company/advanced-search";

  static String allOrderCompany = "$baseUrl/company/order/display-all";

  static String privateOrderByIdCompany = "$baseUrl/company/order/product-order/display-order";

  static String searchProduct ="$baseUrl/company/products/advanced-search";
 // _____________________________________ Employee

 static String allEemployee = "$baseUrl/employee/display-all";

 static String addEmployee = "$baseUrl/employee/add-employee";

 static String updateEmployee = "$baseUrl/employee/update-employee";

 static String searchEmployee = "$baseUrl/employee/advanced-search";

 // ______________________________________ Laboratory

 static String allLaboratory = "$baseUrl/laboratory/display-all";

 static String addLaboratory = "$baseUrl/laboratory/add-laboratory";

 static String updateLaboratory = "$baseUrl/laboratory/update-laboratory";

 static String deleteLaboratory = "$baseUrl/laboratory/delete-laboratory";

 static String orderAdd = "$baseUrl/laboratory/order/add-order";

 static String orderReject = "$baseUrl/laboratory/order/reject-order";

 static String orderAccept = "$baseUrl/laboratory/order/accept-order";

 static String orderDelete = "$baseUrl/laboratory/order/delete-order";

 static String allOrder = "$baseUrl/laboratory/order/display-all";

 static String privateOrder = "$baseUrl/laboratory/order/display-order";

}
