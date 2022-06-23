import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testelogin/Model/user.dart';
import 'package:testelogin/Service/authnotifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../admin/listagemdoadmin.dart';
import '../pags/navegador.dart';

class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;

  void toast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey,
      gravity: ToastGravity.BOTTOM,
    );
  }



  // login
  Future<void> login(
      Users users, AuthNotifier authNotifier, BuildContext context) async {
    UserCredential result;

    try {
      result = await auth.signInWithEmailAndPassword(
          email: users.email, password: users.password);
    } catch (e) {
      toast(e.message.toString());
    }

    // check email verification
    try {
      if (result != null) {
        User user = auth.currentUser;
        if (!user.emailVerified) {
          auth.signOut();
          toast('Email ID not Verified');
        } else if (user != null) {
          print('Logged In: $user');
          authNotifier.setUser(user);
          await getUserDetails(authNotifier);
          print('done');

          // admin or user navigation
          if (authNotifier.userDetails.role == 'admin') {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AdminListag()));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => Home()));
          }
        }
      }
    } catch (e) {
      toast(e.message.toString());
    }
  }

  // sign up
  Future<void> signup(
      Users users, AuthNotifier authNotifier, BuildContext context) async {
    UserCredential result;
    bool userDataUploaded = false;

    try {
      result = await auth.createUserWithEmailAndPassword(
          email: users.email, password: users.password);
    } catch (e) {
      toast(e.message.toString());
    }

    try {
      if (result != null) {
        await auth.currentUser.updateProfile(displayName: users.displayName);

        User user = result.user;
        await user.sendEmailVerification();

        if (user != null) {
          await user.reload();
          print("Sign up: $user");

          uploadUserData(users, userDataUploaded);

          await auth.signOut();
          authNotifier.setUser(null);

          toast('Verification link is sent to ${user.email}');
          Navigator.pop(context);
        }
      }
    } catch (e) {
      toast(e.message.toString());
    }
  }

  // to upload user data
  Future<void> uploadUserData(Users users, bool userDataUploaded) async {
    bool userDataUploadVar = userDataUploaded;

    User currentUser = auth.currentUser;
    users.uuid = currentUser.uid;
    CollectionReference userRef =
    FirebaseFirestore.instance.collection('users');

    // check data uploaded or not
    if (userDataUploadVar != true) {
      await userRef
          .doc(currentUser.uid)
          .set(users.toMap())
          .catchError((e) => print(e))
          .then((value) => userDataUploadVar = true);
    }
  }

  // to get user details
  Future<void> getUserDetails(AuthNotifier authNotifier) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(authNotifier.user.uid)
        .get()
        .catchError((e) => print(e))
        .then((value) => (value != null)
        ? authNotifier.setUserDetails(Users.fromMap(value.data()))
        : print(value));
  }

  // initialize current user
  Future<void> initializeCurrentUser(AuthNotifier authNotifier) async {
    User user = auth.currentUser;

    if (user != null) {
      authNotifier.setUser(user);
      await getUserDetails(authNotifier);
    }
  }

  Future<void> signOut({BuildContext context}) async {
    try {
      await auth.signOut();
    } catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

}