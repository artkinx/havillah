class SignInRequest {
  String? serverkey;
  String? username;
  String? password;
  String? deviceType;

  SignInRequest(
      {this.serverkey, this.username, this.password, this.deviceType});

  SignInRequest.fromJson(Map<String, dynamic> json) {
    serverkey = json['server_key'];
    username = json['username'];
    password = json['password'];
    deviceType = json['deviceType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['server_key'] = serverkey;
    data['username'] = username;
    data['password'] = password;
    data['device_type'] = deviceType;
    return data;
  }
}
