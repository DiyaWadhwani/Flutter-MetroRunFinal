// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:rxdart/rxdart.dart';

// class AuthService {
final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   Stream<User> get onAuthStateChanged => _auth.authStateChanges();

//   Stream<User> user;
//   Stream<Map<String, dynamic>> profile;
//   PublishSubject loading = PublishSubject();

//   AuthService() {
//     user = onAuthStateChanged;
//     profile = user.switchMap((User u) {
//       if(u != null) {
//         return _firestore.collection('users').document(u.uid).snapshots().map();
//       }
//     });
//   }

Future<User> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);

  final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

  final User user = userCredential.user;
  print("User signed in : " + user.displayName);
  print("User UID : " + user.uid);

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
  // print("User IdToken : " + user.getIdToken());

  final User currentUser = _auth.currentUser;
  print("Current User UID : " + currentUser.uid);
  assert(currentUser.uid == user.uid);
  if (currentUser.uid == user.uid) {
    print("UID matches");
  }

  return user;
}

//   void updateUserData(User user) async {}

//   void signOut() {}
// }

// final AuthService authService = AuthService();
