import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser); // Initialize with the current user
    _user.bindStream(auth.userChanges()); // Bind to the user stream
  }

  // Public getter to access the user
  User? get user => _user.value;

  // Check authentication status and navigate to the appropriate screen
  void checkAuthStatus() {
    if (user == null) {
      Get.offAllNamed("/welcome");
    } else {
      Get.offAllNamed("/home");
    }
  }

  // Function for signing up a new user
  void register(String email, String password, String name) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      if (user != null) {
        await user.updateDisplayName(name);
        await user.sendEmailVerification();
        Get.snackbar("Verification Email Sent",
            "A verification email has been sent to $email. Please check your inbox.");
      }
    } catch (e) {
      Get.snackbar("Registration Error", _getAuthErrorMessage(e));
    }
  }

  // Function for logging in a user
  void login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      if (user != null && !user.emailVerified) {
        Get.snackbar("Email Not Verified",
            "Please verify your email before logging in.");
        await auth.signOut();
      } else {
        String? userName = user?.displayName ?? 'Guest';

        Get.offAllNamed("/home", parameters: {
          'userName': userName,
        });
      }
    } catch (e) {
      Get.snackbar("Login Error", _getAuthErrorMessage(e));
    }
  }

  // Function for signing out
  void signOut() async {
    try {
      await auth.signOut();
      Get.offAllNamed("/welcome");
    } catch (e) {
      Get.snackbar("Sign Out Error", "An error occurred while signing out.");
    }
  }

  // Function to reset the password
  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.snackbar("Password Reset",
          "A password reset link has been sent to your email.");
    } catch (e) {
      Get.snackbar("Password Reset Error", _getAuthErrorMessage(e));
    }
  }

  // Function to verify the code
  Future<bool> verifyCode(String code) async {
    try {
      // Replace this with your code verification logic
      return true;
    } catch (e) {
      Get.snackbar("Verification Error", _getAuthErrorMessage(e));
      return false;
    }
  }

  // Helper function to get error messages from FirebaseAuth exceptions
  String _getAuthErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'email-already-in-use':
          return "The email address is already in use by another account.";
        case 'invalid-email':
          return "The email address is invalid.";
        case 'operation-not-allowed':
          return "Operation not allowed. Please enable this service.";
        case 'weak-password':
          return "The password is too weak.";
        case 'user-disabled':
          return "The user account has been disabled.";
        case 'user-not-found':
          return "No user found for that email.";
        case 'wrong-password':
          return "Incorrect password.";
        default:
          return "An unexpected error occurred. Please try again.";
      }
    }
    return "An unexpected error occurred. Please try again.";
  }
}
