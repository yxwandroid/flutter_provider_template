class UserModel {
  int id;
  String userName;
  String userHead;
  String userSignature;
  String blueTooth1;
  String blueTooth2;
  String blueTooth3;
  String blueTooth4;
  String json;

  UserModel(
      {this.id,
      this.userName,
      this.userHead,
      this.userSignature,
      this.blueTooth1,
      this.blueTooth2,
      this.blueTooth3,
      this.blueTooth4,
      this.json});

  UserModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.userName = json['userName'];
    this.userHead = json['userHead'];
    this.userSignature = json['userSignature'];
    this.blueTooth1 = json['blueTooth1'];
    this.blueTooth2 = json['blueTooth2'];
    this.blueTooth3 = json['blueTooth3'];
    this.blueTooth4 = json['blueTooth4'];
    this.json = json['json'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['userHead'] = this.userHead;
    data['userSignature'] = this.userSignature;
    data['blueTooth1'] = this.blueTooth1;
    data['blueTooth2'] = this.blueTooth2;
    data['blueTooth3'] = this.blueTooth3;
    data['blueTooth4'] = this.blueTooth4;
    data['json'] = this.json;
    return data;
  }
}
