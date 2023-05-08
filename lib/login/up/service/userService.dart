import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiktokclone/login/model/userModel.dart';

class UserService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<UserModel> get user {
    return _auth.authStateChanges().asyncMap((user) {
      return UserModel(
        uid: user!.uid,
        email: user.email ?? "",
        pass: '',
      );
    });
  }

  Future<UserModel> auth(UserModel userModel) async {
    UserCredential userCredential;
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
          email: userModel.email, password: userModel.pass);
    } catch (e) {
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.pass);
    }

    userModel.setUid = userCredential.user!.uid;

    return userModel;
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}
