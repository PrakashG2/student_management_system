import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign up with email and password
  Future<String?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Return null if signup is successful
    } on FirebaseAuthException catch (e) {
      return e.message; // Return an error message if signup fails
    }
  }

  // Sign in with email and password
  Future<String?> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Return null if login is successful
    } on FirebaseAuthException catch (e) {
      return e.message; // Return an error message if login fails
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
