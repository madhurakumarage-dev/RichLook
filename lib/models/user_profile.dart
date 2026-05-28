class UserProfile {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String photoUrl;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    this.phone = '',
    this.address = '',
    this.photoUrl = '',
  });

  factory UserProfile.fromMap(String id, Map<String, dynamic> data) {
    return UserProfile(
      id: id,
      name: data['name'] as String? ?? '',
      email: data['email'] as String? ?? '',
      phone: data['phone'] as String? ?? '',
      address: data['address'] as String? ?? '',
      photoUrl: data['photoUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'photoUrl': photoUrl,
    };
  }
}
