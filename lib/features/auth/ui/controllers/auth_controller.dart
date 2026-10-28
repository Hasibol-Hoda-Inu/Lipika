import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/model/sign_up_result_model.dart';
import '../../data/services/auth_service.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService;

  AuthController({required AuthService authService})
    : _authService = authService;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _googleSignInError;
  String? get googleSignInError => _googleSignInError;

  bool _isResending = false;
  String? _resendError;

  bool get isResending => _isResending;
  String? get resendError => _resendError;

  Future<SignUpResult> signUp({required String email, required String password}) async {
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

  Future<bool> resendConfirmationEmail({required String email}) async {
    if (_isResending) return false;

    _isResending = true;
    _resendError = null;
    notifyListeners();

    try {
      await _authService.resendConfirmationEmail(email: email);

      debugPrint("✅ Confirmation email resent successfully");
      return true;
    } on AuthException catch (e) {
      _resendError = e.message;
      debugPrint("❎ Resend email error: ${e.message}");
      return false;
    } catch (e) {
      _resendError = "Something went wrong. Please try again.";
      debugPrint("❎ Unexpected resend error: $e");
      return false;
    } finally {
      _isResending = false;
      notifyListeners();
    }
  }

  Future<bool> signInWithGoogle() async {
    if (_isLoading) return false;

    _isLoading = true;
    _googleSignInError = null;
    notifyListeners();

    try {
      await _authService.signInWithGoogle();

      debugPrint("✅ Google OAuth launched successfully");
      return true;
    } on AuthException catch (e) {
      _googleSignInError = e.message;
      debugPrint("❎ Google Sign-In error: ${e.message}");
      return false;
    } catch (e) {
      _googleSignInError = "Something went wrong. Please try again.";
      debugPrint("❎ Unexpected Google Sign-In error: $e");
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      await _authService.logout();
    } catch (e) {
      debugPrint("❎ Controller logout error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
