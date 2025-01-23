class UserModel {
  static String collectionName = "User";
  String? name;
  String? id;
  String? email;

  UserModel({required this.email, required this.id, required this.name});

//obj>=json
  Map<String, dynamic> toFireStore() {
    return {"id": id, "name": name, "email": email};
  }

  //json=>obj

  UserModel.fromFireStore(Map<String, dynamic> data)
      : this(email: data["id"], name: data["name"], id: data["id"]);
}
