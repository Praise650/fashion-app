abstract class AuthService {
  Future login({String? email, String? password});

  Future register(
      {String? acctType,
      String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? gender});

  Future verifyEmail({
    String? email,
  });
}
