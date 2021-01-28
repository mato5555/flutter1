class UserModel {
  String id;
  String username;
  String email;
  String password;
  String name;
  String phone;
  String level;
  String branch;
  String datesave;

  UserModel(
      {this.id,
      this.username,
      this.email,
      this.password,
      this.name,
      this.phone,
      this.level,
      this.branch,
      this.datesave});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['Username'];
    email = json['Email'];
    password = json['Password'];
    name = json['Name'];
    phone = json['Phone'];
    level = json['Level'];
    branch = json['Branch'];
    datesave = json['datesave'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Username'] = this.username;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['Name'] = this.name;
    data['Phone'] = this.phone;
    data['Level'] = this.level;
    data['Branch'] = this.branch;
    data['datesave'] = this.datesave;
    return data;
  }
}
