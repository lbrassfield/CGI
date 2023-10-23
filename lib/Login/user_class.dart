import 'package:cloud_firestore/cloud_firestore.dart';

class UserCustomerData {
  final String documentId;
  final List<UserData> authenticatedUsers;

  UserCustomerData({
    required this.documentId,
    required this.authenticatedUsers,
  });

  factory UserCustomerData.fromFireStore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    // Extract the fields from the Firestore document
    final documentId = doc.id;
    final authenticatedUsersData = data['authenticated_users'] as List<dynamic>;

    final authenticatedUsers = authenticatedUsersData
        .map((userData) => UserData.fromMap(userData as Map<String, dynamic>))
        .toList();

    return UserCustomerData(
      documentId: documentId,
      authenticatedUsers: authenticatedUsers,
    );
  }
}

class UserData {
  final String firstName;
  final String lastName;
  final String role;
  final String email;
  final String customerId;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.email,
    required this.customerId,
  });

  factory UserData.fromMap(Map<String, dynamic> userData) {
    final firstName = userData['first_name'] as String;
    final lastName = userData['last_name'] as String;
    final role = userData['role'] as String;
    final email = userData['email'] as String;
    final customerId = userData['customer_id'] as String;

    return UserData(
      firstName: firstName,
      lastName: lastName,
      role: role,
      email: email,
      customerId: customerId,
    );
  }
}
