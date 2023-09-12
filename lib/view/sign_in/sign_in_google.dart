import 'package:chat_app/view/sign_in/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInGoogle implements ISignInAccount{
  final GoogleSignIn _signIn = GoogleSignIn();

  late final User user;
  
  @override
  void getUser() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _signIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken      
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(authCredential);

      user = userCredential.user!;

    } catch (e) {
      Get.snackbar("Erro", "Não foi possivel logar!");
    }
  }

}