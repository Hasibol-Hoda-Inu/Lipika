import 'package:flutter/material.dart';

class UploadBookScreen extends StatefulWidget {
  const UploadBookScreen({super.key});

  @override
  State<UploadBookScreen> createState() => _UploadBookScreenState();
}

class _UploadBookScreenState extends State<UploadBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Book"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Fill up book information", style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 6,),
            Text("Fill up the information below to upload your book in the library"),
            const SizedBox(height: 32,),
            Text("Book Name"),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Book Name",
              ),
            ),
            const SizedBox(height: 20,),
            Text("Description"),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Book Name",
              ),
            ),
            const SizedBox(height: 20,),
            Text("Select Category"),
            const SizedBox(height: 20,),
            Text("Upload Book Cover"),
          ],
        ),
      ),
    );
  }
}
