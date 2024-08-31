class CreateUserRequest {
  final String email;
  final String name;
  final String password;

  CreateUserRequest({
    required this.email,
    required this.name,
    required this.password,
  });
}
