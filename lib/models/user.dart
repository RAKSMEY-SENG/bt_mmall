class User {
  
  String ID;
  String user_email;
  String user_pass;

  User({this.ID, this.user_email, this.user_pass});

  factory User.fromJson(Map<String, dynamic> item) {
    return User(
      ID: item['ID'],
      user_email: item['user_email'],
      user_pass: item['user_pass'],
    );
  }
}