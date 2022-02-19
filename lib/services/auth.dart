import "package:firebase_auth/firebase_auth.dart";
import 'package:to_do_app/model/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create lightweight custom user out of (Firebase)User
  CustomUser? _userFromFirebaseUser(User? user) {
    return user != null ? CustomUser(uid: user.uid) : null;
  }

  // return user when user changes
  Stream<CustomUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

  // sign in anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email & password

// register in with email & password
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("sign out error" + e.toString());
      return null;
    }
  }
}

