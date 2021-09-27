class User {
  final String id;
  final String firstname;
  final String lastname;
  final String username;
  final String password;
  final String email;
  final String mobile;
  final String gender;
  final String birth;
  final String course;
  final String nationality;
  final String avatar;
  final String createdAt;

  User({
    required this.createdAt,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.password,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.birth,
    required this.course,
    required this.nationality,
    required this.avatar,
    required this.id,
  });

  factory User.formJson(Map<String, dynamic> json) {
    final id = json['id'];
    final createdAt = json['createdAt'];
    final firstname = json['firstname'];
    final lastname = json['lastname'];
    final username = json['username'];
    final password = json['password'];
    final email = json['email'];
    final mobile = json['mobile'];
    final gender = json['gender'];
    final birth = json['birth'];
    final course = json['course'];
    final nationality = json['nationality'];
    final avatar = json['avatar'];

    return User(
      id: id,
      createdAt: createdAt,
      avatar: avatar,
      birth: birth,
      course: course,
      email: email,
      firstname: firstname,
      gender: gender,
      lastname: lastname,
      mobile: mobile,
      nationality: nationality,
      password: password,
      username: username,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstname': firstname,
        'lastname': lastname,
        'username': username,
        'password': password,
        'email': email,
        'mobile': mobile,
        'gender': gender,
        'birth': birth,
        'course': course,
        'nationality': nationality,
        'avatar': avatar
      };
}
