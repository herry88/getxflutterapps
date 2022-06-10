class LoginModel {
  String? username; 
  String? password; 

  LoginModel({this.username, this.password});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}