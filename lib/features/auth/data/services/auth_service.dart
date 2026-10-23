import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/sign_up_result_model.dart';

class AuthService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<SignUpResult> signUp({required String email, required String password,}) async {
    try {
      final AuthResponse response = await supabase.auth.signUp(
        email: email.trim(),
        password: password,
        emailRedirectTo: 'io.lipika.app://login-callback/',
      );

      if (response.user == null) {
        return const SignUpResult(
          status: SignUpStatus.failed,
          error: "Unable to create account",
        );
      }

      if (response.session == null) {
        return const SignUpResult(status: SignUpStatus.verificationRequired);
      }

      return const SignUpResult(status: SignUpStatus.success);
    } on AuthException catch (e) {
      return SignUpResult(status: SignUpStatus.failed, error: e.message);
    } catch (e) {
      return const SignUpResult(
        status: SignUpStatus.failed,
        error: "Something went wrong. Please try again.",
      );
    }
  }

  Future<void> resendConfirmationEmail({required String email}) async {
    await supabase.auth.resend(type: OtpType.signup, email: email.trim(),  emailRedirectTo: 'io.lipika.app://login-callback/',);
  }

  Future<String?> login(String mail, String pass) async {
    try {
      final AuthResponse response = await supabase.auth.signInWithPassword(
        password: pass,
        email: mail,
      );
      if (response.user != null) {
        return null;
      }
      return "Invalid Email or Password";
    } on AuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      debugPrint("❎ Logout error: ${e.toString()}");
      throw Exception("Failed to logout");
    }
  }

}
