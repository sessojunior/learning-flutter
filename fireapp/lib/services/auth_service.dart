import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          return "O e-mail digitado é inválido.";
        case "wrong-password":
          return "Senha incorreta.";
        case "user-not-found":
          return "Não existe o usuário deste e-mail.";
        case "user-disabled":
          return "O usuário deste e-mail foi desativado.";
        case "too-many-requests":
          return "Muitas requisições. Tente novamente mais tarde.";
        case "operation-not-allowed":
      }
    }
    return null;
  }

  Future<String?> signUp({required String email, required String password, required String name}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.updateDisplayName(email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          return "O e-mail digitado é inválido.";
        case "email-already-in-use":
          return "O e-mail digitado já esta em uso.";
        case "weak-password":
          return "A senha digitada é muito fraca.";
        case "operation-not-allowed":
      }
    }
    return null;
  }

  Future<String?> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          return "O e-mail digitado é inválido.";
        case "user-not-found":
          return "Não existe o usuário deste e-mail.";
        case "user-disabled":
          return "O usuário deste e-mail foi desativado.";
        case "too-many-requests":
          return "Muitas requisições. Tente novamente mais tarde.";
        case "operation-not-allowed":
      }
    }
    return null;
  }

  Future<String?> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<void> sendEmailVerification() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    }
  }

  Future<String?> deleteCurrentUser({required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: _firebaseAuth.currentUser!.email!, password: password);
      await _firebaseAuth.currentUser!.delete();
    } catch (e) {
      return e.toString();
    }
    return null;
  }
}