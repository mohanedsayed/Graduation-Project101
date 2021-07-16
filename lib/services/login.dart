import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthClass {
  FirebaseAuth auth = FirebaseAuth.instance;

  //Create Account
  Future<String> createAccount({String email, String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Account created";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return "Error occurred";
    }
  }

  //Sign in user
  Future<String> signIN({String email, String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Welcome";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
  }

  //Reset Password
  Future<String> resetPassword({String email}) async {
    try {
      await auth.sendPasswordResetEmail(
        email: email,
      );
      return "Email sent";
    } catch (e) {
      return "Error occurred";
    }
  }

  //SignOut
  void signOut() {
    auth.signOut();
  }

  //Google Auth
  Future<UserCredential> signWithGoogle() async {
    final GoogleSignInAccount googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

// Facebook
  // Future<UserCredential> signInWithFacebook() async {
  //   final AccessToken result = await FacebookAuth.instance.login();

  //   final FacebookAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(result.token);

  //   return await FirebaseAuth.instance
  //       .signInWithCredential(facebookAuthCredential);
  // }
}
// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AuthHelper {
//   static FirebaseAuth _auth = FirebaseAuth.instance;

//   static signInWithEmail({String email, String password}) async {
//     final res = await _auth.signInWithEmailAndPassword(
//         email: email, password: password);
//     final User user = res.user;
//     return user;
//   }

//   static signUpWithEmail({String email, String password}) async {
//     final res = await _auth.createUserWithEmailAndPassword(
//         email: email, password: password);
//     final User user = res.user;
//     return user;
//   }

//   static signInWithGoogle() async {
//     GoogleSignIn googleSignIn = GoogleSignIn();
//     final acc = await googleSignIn.signIn();
//     final auth = await acc.authentication;
//     final credential = GoogleAuthProvider.credential(
//       accessToken: auth.accessToken,
//       idToken: auth.idToken,
//     );
//     final res = await _auth.signInWithCredential(credential);
//     return res.user;
//   }

//   static logOut() {
//     // GoogleSignIn().signOut();
//     return _auth.signOut();
//   }
// }

// // class UserHelper {
// //   static FirebaseFirestore _db = FirebaseFirestore.instance;

// //   static saveUser(User user) async {
// //     PackageInfo packageInfo = await PackageInfo.fromPlatform();
// //     int buildNumber = int.parse(packageInfo.buildNumber);
// //     Map<String, dynamic> userData = {
// //       "name": user.displayName,
// //       "email": user.email,
// //       "role": "",
// //       "last_login": user.metadata.lastSignInTime.millisecondsSinceEpoch,
// //       "created_at": user.metadata.creationTime.millisecondsSinceEpoch,
// //       "build_number": buildNumber,
// //     };

// //     final userRef = _db.collection('users').doc(user.uid);
// //     if ((await userRef.get()).exists) {
// //       await userRef.update({
// //         'last_login': user.metadata.lastSignInTime.millisecondsSinceEpoch,
// //         'build_number': buildNumber,
// //       });
// //     } else {
// //       await userRef.set(userData);
// //     }
// //     await _saveDevice(user);
// //   }

// //   static UpdateUserRole(User user, String role) async {
// //     PackageInfo packageInfo = await PackageInfo.fromPlatform();
// //     int buildNumber = int.parse(packageInfo.buildNumber);
// //     Map<String, dynamic> userData = {
// //       "name": user.displayName,
// //       "email": user.email,
// //       "role": role,
// //       "last_login": user.metadata.lastSignInTime.millisecondsSinceEpoch,
// //       "created_at": user.metadata.creationTime.millisecondsSinceEpoch,
// //       "build_number": buildNumber,
// //     };

// //     final userRef = _db.collection('users').doc(user.uid);
// //     if ((await userRef.get()).exists) {
// //       await userRef.update({
// //         'role': role,
// //         'last_login': user.metadata.lastSignInTime.millisecondsSinceEpoch,
// //         'build_number': buildNumber,
// //       });
// //     } else {
// //       await userRef.set(userData);
// //     }
// //     await _saveDevice(user);
// //   }

// //   static _saveDevice(User user) async {
// //     DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
// //     String deviceId;
// //     Map<String, dynamic> deviceData;
// //     if (Platform.isAndroid) {
// //       final deviceInfo = await deviceInfoPlugin.androidInfo;
// //       deviceId = deviceInfo.androidId;
// //       deviceData = {
// //         "os_version": deviceInfo.version.sdkInt.toString(),
// //         "platform": "android",
// //         "model": deviceInfo.model,
// //         "device": deviceInfo.device,
// //       };
// //     }
// //     if (Platform.isIOS) {
// //       final deviceInfo = await deviceInfoPlugin.iosInfo;
// //       deviceId = deviceInfo.identifierForVendor;
// //       deviceData = {
// //         "os_version": deviceInfo.systemVersion,
// //         "platform": "ios",
// //         "model": deviceInfo.model,
// //         "device": deviceInfo.name,
// //       };
// //     }
// //     final nowMs = DateTime.now().millisecondsSinceEpoch;
// //     final deviceRef = _db
// //         .collection("users")
// //         .doc(user.uid)
// //         .collection("devices")
// //         .doc(deviceId);
// //     if ((await deviceRef.get()).exists) {
// //       await deviceRef.update({
// //         "updated_at": nowMs,
// //         "uninstalled": false,
// //       });
// //     } else {
// //       await deviceRef.set({
// //         "updated_at": nowMs,
// //         "uninstalled": false,
// //         "id": deviceId,
// //         "created_at": nowMs,
// //         "device_info": deviceData,
// //       });
// //     }
// //   }
// // }
