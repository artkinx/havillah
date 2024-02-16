class LoginResponse {
  int? apistatus;
  Errors? errors;
  String? timezone;
  String? accesstoken;
  String? userid;
  bool? membership;

  LoginResponse(
      {this.apistatus,
      this.errors,
      this.accesstoken,
      this.membership,
      this.timezone,
      this.userid});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    apistatus = json['api_status'] != null
        ? int.parse(json['api_status'].toString())
        : null;
    timezone = json['timezone'];
    accesstoken = json['accesstoken'];
    userid = json['userid'];
    membership = json['membership'];
    errors = json['errors'] != null ? Errors?.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['api_status'] = apistatus;
    data['timezone'] = timezone;
    data['accesstoken'] = accesstoken;
    data['userid'] = userid;
    data['membership'] = membership;
    data['errors'] = errors!.toJson();
    return data;
  }
}

class Errors {
  int? errorid;
  String? errortext;

  Errors({this.errorid, this.errortext});

  Errors.fromJson(Map<String, dynamic> json) {
    errorid = json['error_id'];
    errortext = json['error_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_id'] = errorid;
    data['error_text'] = errortext;
    return data;
  }
}
