import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:utubevyappar/controller/user_information_controller.dart';
import 'package:utubevyappar/controller/welcome_controller.dart';

class Authentication {
  UserInformationController userInformationController =
      Get.put(UserInformationController());
  WelcomeController welcomeController = Get.find();

  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.toNamed("/home");
    }
    return firebaseApp;
  }

  Future<User?> signInWithGoogle() async {
    welcomeController.isSubmit.value = true;
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        if (userCredential.additionalUserInfo!.isNewUser) {
          //User logging in for the first time
          // Redirect user to tutorial.
          // Get.to("/userInformation");
          // Get.bottomSheet(UserInformation());
          UserInformationController.setIsNewTrue();
        }
        user = userCredential.user;
        if (user != null) {
          await assertChecks(user, auth);
          // Store the retrieved data
          welcomeController.isSubmit.value = false;
          print(user.displayName);
          print(user.uid);
          /*
          email = user.email;
          imageUrl = user.photoURL;
          if (name.contains(" ")) {
            name = name.substring(0, name.indexOf(" "));
          }
          print('signInWithGoogle succeeded: $user');
          return '$user';*/
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          Get.snackbar("error",
              "The account already exists with a different credential.");
        } else if (e.code == 'invalid-credential') {
          Get.snackbar("error",
              "Error occurred while accessing credentials. Try again.");
        }
      } catch (e) {
        Get.snackbar(
            "Error", "Error occurred using Google Sign-In. Try again.");
      }
    }
    return user;
  }

  static Future<void> assertChecks(User user, FirebaseAuth auth) async {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final User? currentUser = auth.currentUser;
    assert(user.uid == currentUser!.uid);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);
  }

  static Future<void> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      await FirebaseAuth.instance.signOut();
      Get.toNamed("/welcome");
    } catch (e) {
      Get.snackbar("Error", "Error signing out. Try again..");
    }
  }
}
