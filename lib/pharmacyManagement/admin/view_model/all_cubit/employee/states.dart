import '../../../model/employee/update_employee.dart';

abstract class EmployeeStates{}

class EmployeeInitialState extends EmployeeStates{}
// _______________________________________ get All Employee
class EmployeeLoadingState extends EmployeeStates {}

class EmployeeSuccessState extends EmployeeStates{}

class EmployeeErrorState extends EmployeeStates{
  final String error ;

  EmployeeErrorState({required this.error});
}
//______________________________________ deleteEmployee

class EmployeeDeleteLoadingState extends EmployeeStates {}

class EmployeeDeleteSuccessState extends EmployeeStates{}

class EmployeeDeleteErrorState extends EmployeeStates{
  final String error ;

  EmployeeDeleteErrorState({required this.error});
}

// ______________________________________updateEmployee

class EmployeeUpdateLoadingState extends EmployeeStates {}

class EmployeeUpdateSuccessState extends EmployeeStates{
  final UpdateEmployeeModelMain model ;

  EmployeeUpdateSuccessState({required this.model});
}

class EmployeeUpdateErrorState extends EmployeeStates{
  final String error ;

  EmployeeUpdateErrorState({required this.error});
}

// _____________________________________ Add Employee
class AddEmployeeLoadingState extends EmployeeStates {}

class AddEmployeeSuccessState extends EmployeeStates{}

class SearchEmployeeLoadingState extends EmployeeStates {}

class SearchEmployeeSuccessState extends EmployeeStates {}