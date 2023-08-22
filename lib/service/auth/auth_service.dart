
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier{
// instance of auth
final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;

//instance of firestore
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Create new user
Future <UserCredential> createNewUserWithEmailandPassword(String email , String password, String fullname , int age, String text, )async{
  try{
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    //after we create a user , we create a collection for each user
    _firestore.collection('users').doc(userCredential.user!.uid).set({
      'uid':userCredential.user!.uid,
      'email':userCredential.user!.email,
      'passsword':password,
      'fullname':fullname,
      'age':age
    });
    return userCredential;
  }on FirebaseAuthException catch (e){
    throw Exception(e.code);
  }
}



//Sign  user in
Future <UserCredential> signInWithEmailandPassword(String email , String password) async {
  try{
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    //add new document to user in users collection if it doenst already exist
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      }, SetOptions(merge: true));
    return userCredential;
  }
  
  // catch any error
  on FirebaseAuthException catch (e){
    throw Exception(e.code);
  }
  
}
//sign user out
Future <void>signOut()async{
  return await FirebaseAuth.instance.signOut();
}

}