import 'package:flutter/material.dart';

import '../../../../application/app_colors.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Settings"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Column(
          spacing: 12,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.top,
                leading: const Icon(Icons.email_outlined),
                title: Text("Change auth",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),),
                subtitle: Text("If you want to switch to a new email or password.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Center(
                    widthFactor: 1.0,
                    child: Icon(Icons.arrow_forward_ios_rounded, size: 16)),
              ),
              ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.top,
                leading: const Icon(Icons.login_rounded),
                title: Text("Logout",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),),
                subtitle: Text("Sign out of your account",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Center(
                    widthFactor: 1.0,
                    child: Icon(Icons.arrow_forward_ios_rounded, size: 16)),
              ),
              ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.top,
                leading: const Icon(Icons.delete_outline_rounded, color: Colors.red,),
                title: Text("Delete account",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),),
                subtitle: Text("Permanently and irreversibly deleting your account.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Center(
                    widthFactor: 1.0,
                    child: Icon(Icons.arrow_forward_ios_rounded, size: 16)),
              ),
              ),
          ],
        ),
      ),
    );
  }
}
