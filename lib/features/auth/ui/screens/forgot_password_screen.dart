import 'package:flutter/material.dart';
import 'package:lipika/features/auth/ui/utils/regex_validators.dart';

import '../../../common/ui/widgets/app_snackbar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({
    super.key,
    required this.onSendResetLink,
    this.initialEmail,
  });

  final Future<String?> Function(String email) onSendResetLink;
  final String? initialEmail;

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.initialEmail ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Text(
                    "Reset your password",
                    style: theme.textTheme.titleLarge,
                  ),
                  Text(
                    "Enter your email address and we'll "
                    "send you a link to reset your password.",
                    style: theme.textTheme.bodyMedium,
                  ),
                  buildResetPasswordForm(),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _sendResetLink,
                      child: _isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text("Send Reset Link"),
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

  Form buildResetPasswordForm() {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        autofillHints: const [AutofillHints.email],
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
          labelText: "Email address",
          hintText: "youremail@mail.com",
          prefixIcon: Icon(Icons.email_outlined),
        ),
        validator: (value) {
          final String email = value?.trim() ?? '';

          if (email.isEmpty) {
            return "Please enter your email";
          } else if (!email.validEmail()) {
            return "Please enter a valid email";
          }

          return null;
        },
        onFieldSubmitted: (_) => _sendResetLink(),
      ),
    );
  }

  Future<void> _sendResetLink() async {
    if (_isLoading) return;
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    String? error;

    try {
      error = await widget.onSendResetLink(_emailController.text.trim());
    } catch (e) {
      debugPrint("Password reset request error: $e");
      error = "Something went wrong. Please try again.";
    }

    if (!mounted) return;

    setState(() => _isLoading = false);

    AppSnackBar.show(
      context,
      message:
          error ??
          "If an account exists for this email, "
              "you'll receive a password reset link.",
      type: error == null ? SnackBarType.success : SnackBarType.error,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
