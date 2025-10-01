import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lipika/application/assets_path.dart';

import '../../../../application/app_colors.dart';
import '../widgets/book_container.dart';
import '../widgets/category_container.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AssetsPath.logo),
        centerTitle: true,
        actions: [
          IconButton.filledTonal(
              onPressed: (){},
              style: IconButton.styleFrom(
                foregroundColor: Colors.grey,
              ),
              icon: Icon(Icons.account_circle_rounded)),
          SizedBox(width: 12,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: 'Explore by categories',),
              SizedBox(height: 12,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (index) {
                    return Padding(
                      padding: EdgeInsets.only(left: (index == 0) ? 0 : 12.0),
                      child: CategoryContainer(),
                    );
                  }),
                ),
              ),
              SizedBox(height: 30,),
              SectionTitle(title: "Books for you",),
              SizedBox(height: 12,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (index) {
                    return Padding(
                      padding: EdgeInsets.only(left: (index == 0) ? 0 : 12.0),
                      child: BookContainer(),
                    );
                  }),
                ),
              ),
              SizedBox(height: 30,),
              Divider(
                color: AppColors.borderColor,
                thickness: 8,
              ),
              SizedBox(height: 30,),
              SectionTitle(title: "Most popular books",),
              SizedBox(height: 12,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (index) {
                    return Padding(
                      padding: EdgeInsets.only(left: (index == 0) ? 0 : 12.0),
                      child: BookContainer(),
                    );
                  }),
                ),
              ),
              SizedBox(height: 30,),
              SectionTitle(title: "New books in library",),
              SizedBox(height: 12,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (index) {
                    return Padding(
                      padding: EdgeInsets.only(left: (index == 0) ? 0 : 12.0),
                      child: BookContainer(),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






