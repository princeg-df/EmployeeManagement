import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Login Register Group Code

class LoginRegisterGroup {
  static String baseUrl =
      'http://ec2-35-78-234-61.ap-northeast-1.compute.amazonaws.com:8080/employeedetails/api/v1';
  static Map<String, String> headers = {};
  static RegistrationCall registrationCall = RegistrationCall();
  static TokenCall tokenCall = TokenCall();
  static LoginCall loginCall = LoginCall();
  static UploadeImageCall uploadeImageCall = UploadeImageCall();
  static DownloadeImageCall downloadeImageCall = DownloadeImageCall();
}

class RegistrationCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? emailId = '',
    String? password = '',
    bool? tncAccepted,
    String? registrationType = 'EMPLOYEE',
    bool? detailsupdated = false,
  }) {
    final body = '''
{
  "firstName": "${firstName}",
  "lastName": "${lastName}",
  "emailId": "${emailId}",
  "password": "${password}",
  "tncAccepted": ${tncAccepted},
  "registrationType": "${registrationType}",
  "detailsupdated": ${detailsupdated}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Registration',
      apiUrl: '${LoginRegisterGroup.baseUrl}/register',
      callType: ApiCallType.POST,
      headers: {
        ...LoginRegisterGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TokenCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Token',
      apiUrl:
          '${LoginRegisterGroup.baseUrl}/employee/oauth/token?grant_type=password&username=${username}&password=${password}',
      callType: ApiCallType.POST,
      headers: {
        ...LoginRegisterGroup.headers,
        'Authorization':
            'Basic ZW1wbG95ZWUuYXBwLmNsaWVudC5lNDhiZmNlOWIwNDc0NTlhODhlY2M0MmRhZWRkNTNlMzpRd2VydHlAMTIz',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic accessToken(dynamic response) => getJsonField(
        response,
        r'''$.access_token''',
      );
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    bool? detailsUpdated = false,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${LoginRegisterGroup.baseUrl}/user/login',
      callType: ApiCallType.POST,
      headers: {
        ...LoginRegisterGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic detailsUpdated(dynamic response) => getJsonField(
        response,
        r'''$.detailsupdated''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.firstName''',
      );
  dynamic role(dynamic response) => getJsonField(
        response,
        r'''$.role''',
      );
}

class UploadeImageCall {
  Future<ApiCallResponse> call({
    String? productImage = '',
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Uploade Image',
      apiUrl: '${LoginRegisterGroup.baseUrl}/user/uploadImage',
      callType: ApiCallType.POST,
      headers: {
        ...LoginRegisterGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'productImage': productImage,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DownloadeImageCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'downloade image',
      apiUrl: '${LoginRegisterGroup.baseUrl}/user/download/{ID}',
      callType: ApiCallType.GET,
      headers: {
        ...LoginRegisterGroup.headers,
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Login Register Group Code

/// Start EmployeeDetails Group Code

class EmployeeDetailsGroup {
  static String baseUrl =
      'http://ec2-35-78-234-61.ap-northeast-1.compute.amazonaws.com:8080/employeedetails/api/v1/employeedetails';
  static Map<String, String> headers = {};
  static AddEmployeeCall addEmployeeCall = AddEmployeeCall();
  static AddAddressCall addAddressCall = AddAddressCall();
  static AddPermanentAddressCall addPermanentAddressCall =
      AddPermanentAddressCall();
  static AddBankDetailsCall addBankDetailsCall = AddBankDetailsCall();
  static UpdateEmployeeInformationCall updateEmployeeInformationCall =
      UpdateEmployeeInformationCall();
  static UpdatEmpAddressCall updatEmpAddressCall = UpdatEmpAddressCall();
  static UpdatEempPermanentAddressCall updatEempPermanentAddressCall =
      UpdatEempPermanentAddressCall();
  static UpdateEmpBankDtailsCall updateEmpBankDtailsCall =
      UpdateEmpBankDtailsCall();
  static GetEmployeeDetailsCall getEmployeeDetailsCall =
      GetEmployeeDetailsCall();
  static EmployerGetEmployeeDetailsCall employerGetEmployeeDetailsCall =
      EmployerGetEmployeeDetailsCall();
  static GetEmployeeBankDetailsCall getEmployeeBankDetailsCall =
      GetEmployeeBankDetailsCall();
  static EmployerGetEmpBankDetailsCall employerGetEmpBankDetailsCall =
      EmployerGetEmpBankDetailsCall();
  static GeyEmployeeAddressCall geyEmployeeAddressCall =
      GeyEmployeeAddressCall();
  static EmployerGetEmpAddressCall employerGetEmpAddressCall =
      EmployerGetEmpAddressCall();
  static GetEmployeePermanentAddressCall getEmployeePermanentAddressCall =
      GetEmployeePermanentAddressCall();
  static EmployerGetPermannentAddressCall employerGetPermannentAddressCall =
      EmployerGetPermannentAddressCall();
}

class AddEmployeeCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? name = '',
    String? salutation = '',
    String? dob = '',
    int? mobileNumber,
    String? location = '',
    String? manager = '',
    String? placeOfBirth = '',
    String? maritalstatus = '',
    int? adharCardNumber,
    String? panCardNumber = '',
    int? emergencyContactNumber,
    int? homeContactNumber,
  }) {
    final body = '''
{
  "name": "${name}",
  "salutation": "${salutation}",
  "dob": "${dob}",
  "mobile_number":${mobileNumber},
  "location":"${location}",
  "manager": "${manager}",
  "place_of_birth": "${placeOfBirth}",
  "maritalstatus": "${maritalstatus}",
  "adhar_card_number":${adharCardNumber},
  "pan_card_number": "${panCardNumber}",
  "emergency_contact_number":${emergencyContactNumber},
  "home_contact_number":${homeContactNumber}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddEmployee',
      apiUrl: '${EmployeeDetailsGroup.baseUrl}/addEmp?organizationId=101',
      callType: ApiCallType.POST,
      headers: {
        ...EmployeeDetailsGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddAddressCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? addressLine1 = '',
    String? addressLine2 = '',
    String? city = '',
    int? postalCode,
    String? state = '',
    String? houseNumber = '',
    String? landMark = '',
  }) {
    final body = '''
{
  "address_Line1": "${addressLine1}",
  "address_Line2": "${addressLine2}",
  "city": "${city}",
  "postal_Code": ${postalCode},
  "state": "${state}",
  "house_number": "${houseNumber}",
  "land_mark": "${landMark}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Address',
      apiUrl: '${EmployeeDetailsGroup.baseUrl}/addaddress',
      callType: ApiCallType.POST,
      headers: {
        ...EmployeeDetailsGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddPermanentAddressCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Add permanent Address',
      apiUrl: '${EmployeeDetailsGroup.baseUrl}/addpermanentaddress',
      callType: ApiCallType.POST,
      headers: {
        ...EmployeeDetailsGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddBankDetailsCall {
  Future<ApiCallResponse> call({
    String? bankCountry = '',
    String? bankName = '',
    String? accountHolderName = '',
    String? accountType = '',
    int? accountNumber,
    String? currency = 'INR',
    String? ifsccode = '',
    String? accessToken = '',
    String? paymentMethode = '',
  }) {
    final body = '''
{
  "bank_country": "${bankCountry}",
  "bank_name": "${bankName}",
  "account_holder_name": "${accountHolderName}",
  "account_type": "${accountType}",
  "account_number": ${accountNumber},
  "currency": "${currency}",
  "payment_methode": "${paymentMethode}",
  "ifsccode": "${ifsccode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Bank Details',
      apiUrl: '${EmployeeDetailsGroup.baseUrl}/addbankdetails',
      callType: ApiCallType.POST,
      headers: {
        ...EmployeeDetailsGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateEmployeeInformationCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? name = '',
    String? salutation = '',
    String? dob = '',
    int? mobileNumber,
    String? location = '',
    String? manager = '',
    String? placeOfBirth = '',
    String? maritalstatus = '',
    int? adharCardNumber,
    String? panCardNo = '',
    int? emergencyContactNumber,
  }) {
    final body = '''
{
  "name": "${name}",
  "salutation": "${salutation}",
  "dob": "${dob}",
  "mobile_number": ${mobileNumber},
  "location": "${location}",
  "manager": "${manager}",
  "place_of_birth": "${placeOfBirth}",
  "maritalstatus": "${maritalstatus}",
  "adhar_card_number": ${adharCardNumber},
  "pan_card_number": "${panCardNo}",
  "emergency_contact_number": ${emergencyContactNumber}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Employee Information',
      apiUrl: '${EmployeeDetailsGroup.baseUrl}/updateempinfo',
      callType: ApiCallType.POST,
      headers: {
        ...EmployeeDetailsGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdatEmpAddressCall {
  Future<ApiCallResponse> call({
    String? addressLine1 = '',
    String? city = '',
    String? state = '',
    String? houseNumber = '',
    String? landMark = '',
    int? postalCode,
    String? accessToken = '',
  }) {
    final body = '''
{
  "address_Line1": "${addressLine1}",
  "city": "${city}",
  "postal_Code": ${postalCode},
  "state": "${state}",
  "house_number": "${houseNumber}",
  "land_mark": "${landMark}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Updat Emp Address',
      apiUrl: '${EmployeeDetailsGroup.baseUrl}/updateempaddress',
      callType: ApiCallType.POST,
      headers: {
        ...EmployeeDetailsGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdatEempPermanentAddressCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Updat Eemp Permanent Address',
      apiUrl: '${EmployeeDetailsGroup.baseUrl}/updateemppermanentaddress',
      callType: ApiCallType.POST,
      headers: {
        ...EmployeeDetailsGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateEmpBankDtailsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Update Emp Bank Dtails',
      apiUrl: '${EmployeeDetailsGroup.baseUrl}/updateempbankdetails',
      callType: ApiCallType.POST,
      headers: {
        ...EmployeeDetailsGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetEmployeeDetailsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Employee Details',
      apiUrl: '${EmployeeDetailsGroup.baseUrl}/getempdetails',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeDetailsGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
  dynamic dob(dynamic response) => getJsonField(
        response,
        r'''$.dob''',
      );
  dynamic mobileNo(dynamic response) => getJsonField(
        response,
        r'''$.mobile_number''',
      );
  dynamic location(dynamic response) => getJsonField(
        response,
        r'''$.location''',
      );
  dynamic manager(dynamic response) => getJsonField(
        response,
        r'''$.manager''',
      );
  dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.salutation''',
      );
  dynamic pob(dynamic response) => getJsonField(
        response,
        r'''$.place_of_birth''',
      );
  dynamic maritalStatus(dynamic response) => getJsonField(
        response,
        r'''$.maritalstatus''',
      );
  dynamic aadharNo(dynamic response) => getJsonField(
        response,
        r'''$.adhar_card_number''',
      );
  dynamic panNo(dynamic response) => getJsonField(
        response,
        r'''$.pan_card_number''',
      );
  dynamic emergencNo(dynamic response) => getJsonField(
        response,
        r'''$.emergency_contact_number''',
      );
}

class EmployerGetEmployeeDetailsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Employer get Employee Details',
      apiUrl: '${EmployeeDetailsGroup.baseUrl}/admin/getempdetails?empId=1',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeDetailsGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetEmployeeBankDetailsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Employee Bank details',
      apiUrl: '${EmployeeDetailsGroup.baseUrl}/getempbankdetails',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeDetailsGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic bankCountry(dynamic response) => getJsonField(
        response,
        r'''$.bank_country''',
      );
  dynamic bankName(dynamic response) => getJsonField(
        response,
        r'''$.bank_name''',
      );
  dynamic aCHolderName(dynamic response) => getJsonField(
        response,
        r'''$.account_holder_name''',
      );
  dynamic accountType(dynamic response) => getJsonField(
        response,
        r'''$.account_type''',
      );
  dynamic accountNo(dynamic response) => getJsonField(
        response,
        r'''$.account_number''',
      );
  dynamic ifsc(dynamic response) => getJsonField(
        response,
        r'''$.ifsccode''',
      );
}

class EmployerGetEmpBankDetailsCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Employer get Emp bank Details',
      apiUrl: '${EmployeeDetailsGroup.baseUrl}/admin/getempbankdetails',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeDetailsGroup.headers,
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GeyEmployeeAddressCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Gey Employee Address',
      apiUrl: '${EmployeeDetailsGroup.baseUrl}/getempaddress',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeDetailsGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic address1(dynamic response) => getJsonField(
        response,
        r'''$.address_Line1''',
      );
  dynamic address2(dynamic response) => getJsonField(
        response,
        r'''$.address_Line2''',
      );
  dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.city''',
      );
  dynamic zipcode(dynamic response) => getJsonField(
        response,
        r'''$.postal_Code''',
      );
  dynamic state(dynamic response) => getJsonField(
        response,
        r'''$.state''',
      );
  dynamic housenumber(dynamic response) => getJsonField(
        response,
        r'''$.house_number''',
      );
  dynamic landmark(dynamic response) => getJsonField(
        response,
        r'''$.land_mark''',
      );
  dynamic type(dynamic response) => getJsonField(
        response,
        r'''$.address_type''',
      );
}

class EmployerGetEmpAddressCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Employer get Emp address',
      apiUrl: '${EmployeeDetailsGroup.baseUrl}/admin/getempaddress',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeDetailsGroup.headers,
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetEmployeePermanentAddressCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Employee Permanent Address',
      apiUrl: '${EmployeeDetailsGroup.baseUrl}/getemppermanentaddress',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeDetailsGroup.headers,
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EmployerGetPermannentAddressCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Employer Get Permannent Address',
      apiUrl: '${EmployeeDetailsGroup.baseUrl}/admin/getemppermanentaddress',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeDetailsGroup.headers,
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End EmployeeDetails Group Code

/// Start Emloyee Goal Group Code

class EmloyeeGoalGroup {
  static String baseUrl =
      'http://ec2-35-78-234-61.ap-northeast-1.compute.amazonaws.com:8080/employeedetails/api/v1/employeegoal';
  static Map<String, String> headers = {};
  static AddEmployeeGoalCall addEmployeeGoalCall = AddEmployeeGoalCall();
  static GetEmployeeGoalCall getEmployeeGoalCall = GetEmployeeGoalCall();
  static EmployerGetEmployeeGoalCall employerGetEmployeeGoalCall =
      EmployerGetEmployeeGoalCall();
  static UpdateEmployeeGoalCall updateEmployeeGoalCall =
      UpdateEmployeeGoalCall();
  static ManagerCommentCall managerCommentCall = ManagerCommentCall();
}

class AddEmployeeGoalCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Add Employee Goal',
      apiUrl: '${EmloyeeGoalGroup.baseUrl}/addempgoal',
      callType: ApiCallType.POST,
      headers: {
        ...EmloyeeGoalGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetEmployeeGoalCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Employee Goal',
      apiUrl: '${EmloyeeGoalGroup.baseUrl}/getgoal',
      callType: ApiCallType.GET,
      headers: {
        ...EmloyeeGoalGroup.headers,
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EmployerGetEmployeeGoalCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Employer get Employee Goal',
      apiUrl: '${EmloyeeGoalGroup.baseUrl}/admin/getgoal',
      callType: ApiCallType.GET,
      headers: {
        ...EmloyeeGoalGroup.headers,
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateEmployeeGoalCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Update Employee Goal',
      apiUrl: '${EmloyeeGoalGroup.baseUrl}/updateempgoal',
      callType: ApiCallType.POST,
      headers: {
        ...EmloyeeGoalGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ManagerCommentCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Manager Comment',
      apiUrl: '${EmloyeeGoalGroup.baseUrl}/admin/comment',
      callType: ApiCallType.POST,
      headers: {
        ...EmloyeeGoalGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Emloyee Goal Group Code

/// Start Employee Organizaation Group Code

class EmployeeOrganizaationGroup {
  static String baseUrl =
      'http://ec2-35-78-234-61.ap-northeast-1.compute.amazonaws.com:8080/employeedetails/api/v1/employeeorganization';
  static Map<String, String> headers = {};
  static EmployerAddOrganizationDetailsCall employerAddOrganizationDetailsCall =
      EmployerAddOrganizationDetailsCall();
  static EmployerAddEmployementDetailsCall employerAddEmployementDetailsCall =
      EmployerAddEmployementDetailsCall();
  static GetEmployemtDetailsCall getEmployemtDetailsCall =
      GetEmployemtDetailsCall();
  static EmployerGetEmployementDetailsCall employerGetEmployementDetailsCall =
      EmployerGetEmployementDetailsCall();
  static GetOrganizationDetailsCall getOrganizationDetailsCall =
      GetOrganizationDetailsCall();
  static AdminGetOrganizatojnDetailsCall adminGetOrganizatojnDetailsCall =
      AdminGetOrganizatojnDetailsCall();
  static EmployeGetAllEmployeeCall employeGetAllEmployeeCall =
      EmployeGetAllEmployeeCall();
}

class EmployerAddOrganizationDetailsCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Employer Add Organization Details',
      apiUrl:
          '${EmployeeOrganizaationGroup.baseUrl}/admin/addorganizationdetails',
      callType: ApiCallType.POST,
      headers: {
        ...EmployeeOrganizaationGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EmployerAddEmployementDetailsCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Employer Add Employement Details',
      apiUrl:
          '${EmployeeOrganizaationGroup.baseUrl}/admin/addemployementdetails',
      callType: ApiCallType.POST,
      headers: {
        ...EmployeeOrganizaationGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetEmployemtDetailsCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Employemt details',
      apiUrl: '${EmployeeOrganizaationGroup.baseUrl}/getemploymentdetails',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeOrganizaationGroup.headers,
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EmployerGetEmployementDetailsCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Employer get Employement Details',
      apiUrl:
          '${EmployeeOrganizaationGroup.baseUrl}/admin/getemploymentdetails',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeOrganizaationGroup.headers,
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetOrganizationDetailsCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Organization Details',
      apiUrl: '${EmployeeOrganizaationGroup.baseUrl}/getorganizationdetails',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeOrganizaationGroup.headers,
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AdminGetOrganizatojnDetailsCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Admin Get Organizatojn details',
      apiUrl:
          '${EmployeeOrganizaationGroup.baseUrl}/admin/getorganizationdetails',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeOrganizaationGroup.headers,
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EmployeGetAllEmployeeCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Employe get All Employee',
      apiUrl: '${EmployeeOrganizaationGroup.baseUrl}/admin/getallemployee',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeOrganizaationGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic empName(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
      );
  dynamic position(dynamic response) => getJsonField(
        response,
        r'''$[:].position''',
      );
}

/// End Employee Organizaation Group Code

/// Start Employee Compansastion Group Code

class EmployeeCompansastionGroup {
  static String baseUrl =
      'http://ec2-35-78-234-61.ap-northeast-1.compute.amazonaws.com:8080/employeedetails/api/v1/employeecompansastion';
  static Map<String, String> headers = {};
  static EmployerAddCompansationDetailsCall employerAddCompansationDetailsCall =
      EmployerAddCompansationDetailsCall();
  static EmployerAddBonusPlanCall employerAddBonusPlanCall =
      EmployerAddBonusPlanCall();
  static EmployerUpdateCompanstationDetailsCall
      employerUpdateCompanstationDetailsCall =
      EmployerUpdateCompanstationDetailsCall();
  static GetCompanstationDetailsCall getCompanstationDetailsCall =
      GetCompanstationDetailsCall();
  static EmployerGetCompensationDetailCall employerGetCompensationDetailCall =
      EmployerGetCompensationDetailCall();
  static GetBonusPlanCall getBonusPlanCall = GetBonusPlanCall();
  static EmployerGetBonusPlanCall employerGetBonusPlanCall =
      EmployerGetBonusPlanCall();
  static GetCompenstationHistoryCall getCompenstationHistoryCall =
      GetCompenstationHistoryCall();
  static EmployerGetCompenstationHistoryCall
      employerGetCompenstationHistoryCall =
      EmployerGetCompenstationHistoryCall();
}

class EmployerAddCompansationDetailsCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Employer Add Compansation Details',
      apiUrl:
          '${EmployeeCompansastionGroup.baseUrl}/admin/addempcompenstationdetails',
      callType: ApiCallType.POST,
      headers: {
        ...EmployeeCompansastionGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EmployerAddBonusPlanCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Employer Add bonus plan',
      apiUrl: '${EmployeeCompansastionGroup.baseUrl}/admin/addempbonusplan',
      callType: ApiCallType.POST,
      headers: {
        ...EmployeeCompansastionGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EmployerUpdateCompanstationDetailsCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Employer update Companstation Details',
      apiUrl:
          '${EmployeeCompansastionGroup.baseUrl}/admin/updateempcompenstationdetails',
      callType: ApiCallType.POST,
      headers: {
        ...EmployeeCompansastionGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetCompanstationDetailsCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Companstation Details',
      apiUrl: '${EmployeeCompansastionGroup.baseUrl}/getempcompensationdetails',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeCompansastionGroup.headers,
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EmployerGetCompensationDetailCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Employer Get Compensation Detail',
      apiUrl:
          '${EmployeeCompansastionGroup.baseUrl}/admin/getempcompensationdetails',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeCompansastionGroup.headers,
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetBonusPlanCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get bonus plan',
      apiUrl: '${EmployeeCompansastionGroup.baseUrl}/getempbonusplan',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeCompansastionGroup.headers,
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EmployerGetBonusPlanCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Employer get Bonus plan',
      apiUrl: '${EmployeeCompansastionGroup.baseUrl}/admin/getempbonusplan',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeCompansastionGroup.headers,
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetCompenstationHistoryCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Compenstation history',
      apiUrl: '${EmployeeCompansastionGroup.baseUrl}/getempcompesationhistory',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeCompansastionGroup.headers,
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EmployerGetCompenstationHistoryCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Employer Get Compenstation history',
      apiUrl:
          '${EmployeeCompansastionGroup.baseUrl}/admin/getempcompesationhistory',
      callType: ApiCallType.GET,
      headers: {
        ...EmployeeCompansastionGroup.headers,
      },
      params: {},
      returnBody: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Employee Compansastion Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
