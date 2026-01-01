import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  User? user;
  Map<String, dynamic>? userData;
  bool isLoading = false;

  AuthProvider() {
    _authService.authStateChanges.listen((User? newUser) async {
      user = newUser;
      if (user != null) {
        await loadUserData();
      } else {
        userData = null;
      }
      notifyListeners();
    });
  }

  Future<void> loadUserData() async {
    isLoading = true;
    notifyListeners();

    userData = await _authService.getCurrentUserData();

    isLoading = false;
    notifyListeners();
  }

  Future<void> logIn(String email, String password) async {
    await _authService.signIn(email, password);
  }

  Future<void> signUp(String name, String email, String password,) async {
    await _authService.signUp(name, email, password);
  }

  Future<void> logOut() async {
    await _authService.signOut();
  }

  Future<void> updateName(String name) async {
    await _authService.updateUserName(name);
    await loadUserData();
  }

  Future<void> updatePassword(String newPassword) async {
    await _authService.updatePassword(newPassword);
  }

  bool get isAuthenticated => user != null;
}
