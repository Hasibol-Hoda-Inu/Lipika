import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lipika/application/assets_path.dart';

import '../../../../application/routes/app_route_const.dart';


class MyLibrary extends StatefulWidget {
  const MyLibrary({super.key});

  @override
  State<MyLibrary> createState() => _MyLibraryState();
}

class _MyLibraryState extends State<MyLibrary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Library"),
        actions: [
          ElevatedButton.icon(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2)
              ),
              icon: const Icon(Icons.add),
              label: const Text("Add")),
          const SizedBox(width: 20,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Expanded(
              child: GridView.builder(
                itemCount: 3,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.72
                  ),
                  itemBuilder: (context, index)=> InkWell(
                    onTap: _onTapNextScreen,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                              child: Image.asset(AssetsPath.book,)),
                        ),
                        Text("Category Name",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
  void _onTapNextScreen(){
    GoRouter.of(context).pushNamed(AppRouteConst.categoriesRouteName);
  }
}
