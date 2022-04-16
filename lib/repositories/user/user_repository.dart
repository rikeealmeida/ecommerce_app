import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  UserRepository({this.firebaseAuth});

//signup with email and password
  Future<User> signUp(String email, String password) async {
    try {
      var auth = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return auth.user;
    } catch (err) {
      print(err.toString());
    }
  }

//signin with email and password
  Future<User> signIn(String email, String password) async {
    try {
      var auth = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return auth.user;
    } catch (err) {
      print(err.toString());
    }
  }

//signout

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

//check signin

  Future<bool> isSignedIn() async {
    var currentUser = await firebaseAuth.currentUser;
    return currentUser != null;
  }

//get current user


  Future<User> getCurrentUser() async {
  return await firebaseAuth.currentUser;
  }


}
