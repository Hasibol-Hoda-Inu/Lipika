import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../common/ui/widgets/app_snackbar.dart';
import '../controllers/auth_controller.dart';

class EmailConfirmationScreen extends StatelessWidget {
  final String email;

  const EmailConfirmationScreen({super.key, required this.email});

  Future<void> _resendEmail(BuildContext context) async {

    final AuthController controller = context.read<AuthController>();
    final bool success = await controller.resendConfirmationEmail(email: email);
    if (!context.mounted) return;

    AppSnackBar.show(
      context,
      message: success
          ? "Verification email sent successfully!"
          : controller.resendError ?? "Unable to resend email.",
      type: success ? SnackBarType.success : SnackBarType.error,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Email Confirmation"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:[
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.mark_email_unread_outlined,
                      size: 48,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    "Check your inbox",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "We've sent a verification link to",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  SelectableText(
                    email.isEmpty ? "your email address" : email,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Open your email and click the "
                    "confirmation link to verify "
                    "your account.",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Consumer<AuthController>(
                    builder: (context, controller, child) {
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: controller.isResending || email.isEmpty
                                  ? null
                                  : () => _resendEmail(context),
                              child: controller.isResending
                                  ? const SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text("Resend Confirmation Email"),
                            ),
                          );
                        },
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      context.goNamed("signIn");
                    },
                    child: const Text("Back to Sign In"),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Didn't receive an email? "
                    "Check your spam folder.",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}