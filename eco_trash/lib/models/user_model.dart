class User {
  final String id;
  final String name;
  final String role;
  final String email;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      role: json['role'],
      email: json['email'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'role': role,
      'email': email,
      'token': token,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'],
      name: map['name'],
      role: map['role'],
      email: map['email'],
      token: map['token'],
    );
  }
}
