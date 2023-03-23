abstract class DBService {
  Future sendMessage({String? message, String? recipientID});

  Future getUserMessage({String? recipientID});

  Future uploadUserDetails(
      {String? acctType,
      String? firstName,
      String? lastName,
      String? email,
      String? uid,
      String? phoneNumber,
      String? gender});
}
