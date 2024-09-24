class UserModel {
 late String user_id;
 late String user_name;
 late String email;
 late DateTime birth;

  UserModel(this.user_id, this.user_name, this.email, this.birth);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_id': user_id,
      'user_name': user_name,
      'email': email,
      'birth': birth
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    user_id = map['user_id'];
    user_name = map['user_name'];
    email = map['email'];
    birth = map['birth'];
  }
}
