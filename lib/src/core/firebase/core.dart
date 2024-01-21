import 'package:firebase_core/firebase_core.dart';
import 'package:pey/firebase_options.dart';

class FirebaseCore {
  static create() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
