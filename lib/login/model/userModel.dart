class UserModel {
  final String email;
  final String pass;
  String uid;

  UserModel({
    required this.uid,
    required this.email,
    required this.pass,
  });

  set setUid(value) => uid = value;

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'password': pass,
      };
}
