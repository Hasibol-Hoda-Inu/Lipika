import 'package:flutter/foundation.dart';

import '../../data/model/sign_up_result_model.dart';
import '../../data/services/auth_service.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService;

  AuthController({required AuthService authService})
      : _authService = authService;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<SignUpResult> signUp({
    required String email,
    required String password,
  }) async {
    if (_isLoading) {
      return const SignUpResult(
        status: SignUpStatus.failed,
        error: "Registration is already in progress.",
      );
    }

    _isLoading = true;
    notifyListeners();

    try {
      final SignUpResult result = await _authService.signUp(
        email: email,
        password: password,
      );

      debugPrint("Sign up status: ${result.status.name}");

      if (result.status == SignUpStatus.failed) {
        debugPrint("Sign up error: ${result.error}");
      }

      return result;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
