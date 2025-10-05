import 'package:flutter/material.dart';

import '../../../../application/app_colors.dart';
import '../../../common/ui/screens/upload_book_screen.dart';

class MyBooks extends StatefulWidget {
  const MyBooks({super.key});

  @override
  State<MyBooks> createState() => _MyBooksState();
}

class _MyBooksState extends State<MyBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Books"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          spacing: 6,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nothing Uploaded", style: Theme.of(context).textTheme.titleLarge,),
            Text("You can upload your books here and people can buy the books",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onTapUploadBookScreen,
        backgroundColor: AppColors.themeColor,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }

  void onTapUploadBookScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadBookScreen()));
  }
}
