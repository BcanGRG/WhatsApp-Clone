import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wp_clone_provider/core/locator.dart';
import 'package:wp_clone_provider/core/services/auth_service.dart';
import 'package:wp_clone_provider/viewmodels/base_model.dart';

class SignInModel extends BaseModel {
  final AuthService _authService = getIt<AuthService>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  signIn(String userName) async {
    if (userName.isEmpty) return;
    busy = true;
    try {
      var user = await _authService.signIn();
      await _firestore.collection("profile").doc(user!.uid).set({
        "userName": userName,
        "image":
            "https://dolphinkaravan.com.tr/wp-content/uploads/2019/12/bay-icon.jpg",
      });
    } catch (e) {
      busy = false;
    }

    busy = false;
  }
}
