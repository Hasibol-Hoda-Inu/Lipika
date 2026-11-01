import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/ui/widgets/app_snackbar.dart';
import '../controllers/auth_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({
    super.key,
    required this.onUpdatePassword,
    this.onPasswordUpdated,
  });

  final Future<String?> Function(String password) onUpdatePassword;
  final VoidCallback? onPasswordUpdated;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("New Password")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Column(
                spacing: 20,
                crossAxisAlignment: .start,
                children: [
                  Text("Set a new password", style: theme.textTheme.titleLarge),
                  Text(
                    "Create a new password to secure your "
                    "Lipika account.",
                    style: theme.textTheme.bodyMedium,
                  ),
                  buildResetPassForm(),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: Consumer<AuthController>(
                      builder: (context, controller, child) {
                        return ElevatedButton(
                          onPressed: controller.isLoading
                              ? null
                              : _updatePassword,
                          child: controller.isLoading
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text("Update Password"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form buildResetPassForm() {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 20,
        crossAxisAlignment: .start,
        children: [
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.newPassword],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelText: "New Password",
              hintText: "Enter new password",
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a password";
              }
              if (value.length < 6) {
                return "Password must be at least 6 characters";
              }
              return null;
            },
          ),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: _obscureConfirmPassword,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.newPassword],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelText: "Confirm Password",
              hintText: "Re-enter your password",
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
                icon: Icon(
                  _obscureConfirmPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please confirm your password";
              }
              if (value != _passwordController.text) {
                return "Passwords do not match";
              }
              return null;
            },
            onFieldSubmitted: (_) => _updatePassword(),
          ),
        ],
      ),
    );
  }

  Future<void> _updatePassword() async {
    if (!_formKey.currentState!.validate()) return;

    final AuthController controller = context.read<AuthController>();

    if (controller.isLoading) return;

    try {
      final String? error = await widget.onUpdatePassword(
        _passwordController.text,
      );

      if (!mounted) return;
      if (error != null) {
        AppSnackBar.show(context, message: error, type: SnackBarType.error);
        return;
      }

      // Password updated. Sign out recovery session.
      final bool isLoggedOut = await controller.logout();

      if (!mounted) return;

      if (!isLoggedOut) {
        AppSnackBar.show(
          context,
          message: "Password updated, but logout failed.",
          type: SnackBarType.error,
        );
      }

      // Successful logout triggers GoRouter -> Login.
    } catch (e) {
      debugPrint("❎ Password recovery error: $e");
      if (!mounted) return;

      AppSnackBar.show(
        context,
        message: "Something went wrong. Please try again.",
        type: SnackBarType.error,
      );
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
