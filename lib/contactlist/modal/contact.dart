class ContactModal {
  final String fullName;
  final String email;

  const ContactModal({required this.fullName, required this.email});
  factory ContactModal.fromMap(Map<String, dynamic> json) {
    return ContactModal(fullName: json['fullname'], email: json['email']);
  }
}
