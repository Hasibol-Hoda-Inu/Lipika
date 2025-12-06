import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lipika/application/assets_path.dart';

import '../../../../application/app_colors.dart';
import '../../../../application/routes/app_route_const.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final List<IconData> _icons = [
    Icons.person,
    Icons.edit,
    Icons.settings,
    Icons.privacy_tip,
    Icons.swap_horiz_outlined
  ];
  final List<String> _titles = [
    "Personal Details",
    "Address",
    "Account Settings",
    "Privacy Policy",
    "Return & Exchange Policy",
  ];

  late final List<VoidCallback> _methods;

  @override
  void initState() {
    super.initState();
    _methods = [
      onTapPDScreen,
      onTapAddressScreen,
      onTapAccountSettingsScreen,
      onTapPrivacyPolicyScreen,
      onTapReturnExchangeScreen,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 10,
                children: [
                  Image.asset(AssetsPath.avatar, width: 32,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),),
                      const Text("About text"),
                    ],
                  )
                ],
              ),
              Text("Account", style: Theme.of(context).textTheme.titleLarge,),
              ListView.separated(
                shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index)=> ListTile(
                    onTap: _methods.elementAt(index),
                    leading: Icon(_icons.elementAt(index)),
                    title: Text(_titles[index]),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  separatorBuilder: (context, index)=> const Divider(
                    color: AppColors.borderColor,
                  ),
                  itemCount: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapPDScreen(){
    GoRouter.of(context).pushNamed(AppRouteConst.profileDetailsRouteName);
  }
  void onTapAddressScreen(){
    GoRouter.of(context).pushNamed(AppRouteConst.profileDetailsRouteName);
  }
  void onTapAccountSettingsScreen(){
    GoRouter.of(context).pushNamed(AppRouteConst.accountSettingsRouteName);
  }
  void onTapPrivacyPolicyScreen(){
    GoRouter.of(context).pushNamed(AppRouteConst.privacyPolicyRouteName);
  }
  void onTapReturnExchangeScreen(){
    GoRouter.of(context).pushNamed(AppRouteConst.returnPolicyRouteName);
  }
}
