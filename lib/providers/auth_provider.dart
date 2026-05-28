import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_profile.dart';
import '../services/firebase_service.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseService.auth;
  final FirebaseFirestore _firestore = FirebaseService.firestore;

  User? user;
  UserProfile? profile;
  bool isLoading = true;
  String? errorMessage;

  AuthProvider() {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  bool get isAuthenticated => user != null;

  Future<void> _onAuthStateChanged(User? firebaseUser) async {
    user = firebaseUser;
    if (user != null) {
      await _loadProfile();
    } else {
      profile = null;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> _loadProfile() async {
    if (user == null) return;
    final doc = await _firestore.collection('users').doc(user!.uid).get();
    if (doc.exists && doc.data() != null) {
      profile = UserProfile.fromMap(doc.id, doc.data()!);
    } else {
      profile = UserProfile(
        id: user!.uid,
        name: user!.displayName ?? '',
        email: user!.email ?? '',
      );
      await _firestore.collection('users').doc(user!.uid).set(profile!.toMap());
    }
  }

  Future<bool> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      user = userCredential.user;
      await user?.updateDisplayName(name);
      if (user != null) {
        profile = UserProfile(
          id: user!.uid,
          name: name,
          email: email.trim(),
        );
        await _firestore.collection('users').doc(user!.uid).set(profile!.toMap());
      }
      errorMessage = null;
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      user = userCredential.user;
      errorMessage = null;
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    user = null;
    profile = null;
    notifyListeners();
  }

  Future<bool> updateProfile({
    required String name,
    required String address,
    required String phone,
  }) async {
    if (user == null) return false;
    try {
      isLoading = true;
      notifyListeners();
      final updatedProfile = UserProfile(
        id: user!.uid,
        name: name,
        email: user!.email ?? profile?.email ?? '',
        address: address,
        phone: phone,
        photoUrl: profile?.photoUrl ?? '',
      );
      await _firestore.collection('users').doc(user!.uid).set(updatedProfile.toMap());
      profile = updatedProfile;
      await user!.updateDisplayName(name);
      errorMessage = null;
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
