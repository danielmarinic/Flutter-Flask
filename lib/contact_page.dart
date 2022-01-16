import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'contactlist/contact_list.dart';
import 'contactlist/modal/contact.dart';

class ContactPage extends StatelessWidget {
  _buildContactList() {

    return <ContactModal>[
      const ContactModal(
          fullName: 'Daniel Marinič', email: 'daniel.marinic@gmail.com'),
      const ContactModal(
          fullName: 'Peter Stašák', email: 'peter.stasak@example.com'),
      const ContactModal(
          fullName: 'Zuzana Čaputová', email: 'zuzana.caputova@example.com'),
      const ContactModal(
          fullName: 'Jozef Golonka', email: 'jozef.golonka@example.com'),
      ];
  }

  getDateFromApi() async {
    var client = new http.Client();
    try {
      var response = await client.get(Uri.parse('http://localhost:5000/contacts'));
      if(response.statusCode == 200) {
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        return parsed.map<ContactModal>((one) => ContactModal.fromMap(one)).toList();
      }
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ContactsList(_buildContactList()));
  }
}
