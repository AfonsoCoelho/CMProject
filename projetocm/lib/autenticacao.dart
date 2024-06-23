
import 'package:firebase_auth/firebase_auth.dart';

class Autenticacao{
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
registarUser ({
required String name,
required String email, 
required String password

}) async {
UserCredential userCredential= await   firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

await userCredential.user!.updateDisplayName(name);

}


}