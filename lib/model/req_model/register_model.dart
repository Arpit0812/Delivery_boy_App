class RegisterModel {
  String? name;
  String? email;
  String? mobileNo;
  String? loginBy;

  RegisterModel({this.name, this.email, this.mobileNo, this.loginBy});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    loginBy = json['login_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    data['login_by'] = this.loginBy;
    return data;
  }
}
