import 'package:flutter/material.dart';

enum SnackBarType {
  success,
  error,
  info,
}

class AppSnackBar extends StatelessWidget {
  final String message;
  final SnackBarType type;

  const AppSnackBar({
    super.key,
    required this.message,
    this.type = SnackBarType.info,
  });

  static void show(
      BuildContext context, {
        required String message,
        SnackBarType type = SnackBarType.info,
      }) {
    final ScaffoldMessengerState messenger =
    ScaffoldMessenger.of(context);

    messenger.hideCurrentSnackBar();

    messenger.showSnackBar(
      SnackBar(
        content: AppSnackBar(
          message: message,
          type: type,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 4),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = switch (type) {
      SnackBarType.success => const Color(0xFF176444),
      SnackBarType.error => const Color(0xFFAD302B),
      SnackBarType.info => const Color(0xFF293443),
    };

    final IconData icon = switch (type) {
      SnackBarType.success => Icons.check_circle_outline,
      SnackBarType.error => Icons.error_outline,
      SnackBarType.info => Icons.info_outline,
    };

    final String title = switch (type) {
      SnackBarType.success => "Success",
      SnackBarType.error => "Error",
      SnackBarType.info => "Information",
    };

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.white, size: 26),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .hideCurrentSnackBar();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white70,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
