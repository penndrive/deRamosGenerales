import 'dart:async';
import 'package:deramosgenerales/BLoC/BLoC_Login/AuthState.dart';
import 'package:deramosgenerales/BLoC/BLoC_Login/LoginEvents.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bloc/bloc.dart';


class LoginBloc extends Bloc<AuthEvent,AuthState>{
 final FirebaseAuth _auth = FirebaseAuth.instance;
 final GoogleSignIn googleSignIn = new GoogleSignIn();
 FirebaseUser user;
 
  signin()async{
GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: gSA.accessToken,
      idToken: gSA.idToken,
    );
    final FirebaseUser user2 = await _auth.signInWithCredential(credential);
    user=user2;
    
  dispatch(LogIn());
}
  signOut()async{
    await _auth.signOut();
    user = await _auth.currentUser();
    dispatch(LogOut());
  }

  @override
  AuthState get initialState => AuthState(user:user);

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async*{
  if (event is LogIn) {
      yield AuthState(user:user,status: true);
    } else if (event is LogOut) {
      yield AuthState(user: null,status: false);
    }
  }

  
}