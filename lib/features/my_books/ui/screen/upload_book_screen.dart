import 'package:flutter/material.dart';
import 'package:lipika/application/assets_path.dart';

import '../widgets/choose_options.dart';

class UploadBookScreen extends StatefulWidget {
  const UploadBookScreen({super.key});

  @override
  State<UploadBookScreen> createState() => _UploadBookScreenState();
}

class _UploadBookScreenState extends State<UploadBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Book"), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 340,
                child: Image.asset(AssetsPath.book),
              ),
              SizedBox(height: 20),
              RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: "Author: ",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
                    ),
                    TextSpan(
                      text: "Author name\n",
                    ),
                    TextSpan(
                      text: "Book Name: ",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
                    ),
                    TextSpan(
                      text: "Book Name\n",
                    ),
                    TextSpan(
                      text: "Book Description: ",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
                    ),TextSpan(
                      text: "Fill up the information below to upload your book in the library",
                    ),

                  ]
              )),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              ChooseOptions(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Continue"),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}


