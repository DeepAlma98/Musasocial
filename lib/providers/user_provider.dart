import 'package:flutter/material.dart';
import 'package:musasocial/api/auth/authentication.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final Authentication _authMethods = Authentication();

  User get getUser {
    if (_user == null) {
      const Center(child: CircularProgressIndicator());
      throw Exception("Utente non disponibile");
    }
    return _user!;
  }

  Future<void> refreshUser() async {
    _user = await _authMethods.getUserDetails();
    notifyListeners();
  }
}