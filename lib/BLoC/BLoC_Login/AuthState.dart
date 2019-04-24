import 'package:firebase_auth/firebase_auth.dart';

class AuthState{

final FirebaseUser user;
final bool status;
const AuthState({this.status,this.user});

//factory AuthState.initial() =>AuthState();
}