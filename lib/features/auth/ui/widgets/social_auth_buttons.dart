import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lipika/features/common/ui/widgets/app_snackbar.dart';
import 'package:provider/provider.dart';

import 'package:lipika/application/assets_path.dart';
import '../controllers/auth_controller.dart';

class SocialAuthButtons extends StatelessWidget {
  const SocialAuthButtons({
    super.key,
    required this.googleButtonText,
  });

  final String googleButtonText;

  @override
  Widget build(BuildContext context) {
    final bool isLoading = context.select<AuthController, bool>((controller) => controller.isLoading);

    return Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: isLoading ? null : () => _onGooglePressed(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            icon: SvgPicture.asset(AssetsPath.google, width: 28, height: 28),
            label: Text(googleButtonText),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: isLoading
                ? null
                : () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Apple Sign-In is not available yet."),
                      ),
                    );
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.apple, size: 28),
            label: const Text("Continue with Apple"),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Future<void> _onGooglePressed(BuildContext context) async {
    final AuthController controller = context.read<AuthController>();
    final bool launched = await controller.signInWithGoogle();
    if (!context.mounted) return;

    if (!launched) {
      AppSnackBar.show(context, message: controller.googleSignInError ?? "Unable to start Google Sign-In.", type: SnackBarType.error);
    }
  }
}
