import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../application/app_colors.dart';
import '../../../../application/assets_path.dart';
import '../../../../application/routes/app_route_const.dart';

class MyBooks extends StatefulWidget {
  const MyBooks({super.key});

  @override
  State<MyBooks> createState() => _MyBooksState();
}

class _MyBooksState extends State<MyBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Books"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          spacing: 6,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsPath.emptyFolder, width: 160),
            Text(
              "Nothing Uploaded",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "You can upload your books here and people can buy the books",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapUploadBookScreen,
        backgroundColor: AppColors.themeColor,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onTapUploadBookScreen() {
    GoRouter.of(context).pushNamed(AppRouteConst.uploadBookRouteName);
  }
}
