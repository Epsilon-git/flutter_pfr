import 'package:firebase_core/firebase_core.dart';
import 'package:pfr/utils/firebase_options.dart';

class FirebaseHelper {
  static connect() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
