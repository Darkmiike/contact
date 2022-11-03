class Users {
  final String name;
  final String username;
  final String email;

  Users({required this.name, required this.username, required this.email});

  factory Users.fromJson(Map<String, dynamic> people) {
    return Users(
        name: people['name'],
        username: people['username'],
        email: people['email']);
  }
}
