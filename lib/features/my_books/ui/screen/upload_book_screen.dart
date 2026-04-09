import 'package:flutter/material.dart';
import 'package:lipika/application/assets_path.dart';

import '../widgets/choose_options.dart';

class UploadBookScreen extends StatefulWidget {
  const UploadBookScreen({super.key});

  @override
  State<UploadBookScreen> createState() => _UploadBookScreenState();
}

class _UploadBookScreenState extends State<UploadBookScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Book"),
        centerTitle: true,
        // actions: [
        //   SizedBox(
        //     width: 90,
        //     child: ElevatedButton.icon(
        //         onPressed: (){},
        //       style: ElevatedButton.styleFrom(
        //         padding: const EdgeInsets.symmetric(vertical: 10),
        //       ),
        //         icon: const Icon(Icons.edit),
        //         label: const Text("Add"),
        //     ),
        //   ),
        //   const SizedBox(width: 12,),
        // ],
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12,),
              Form(
                key: _formKey,
                child: Column(
                  spacing: 12,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Book Name",
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Author Name",
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Publisher Name"
                      ),
                    ),
                    Row(
                      spacing: 12,
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                labelText: "Price"
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                                labelText: "Edition"
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      maxLines: 3,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: const InputDecoration(
                        labelText: "Description",
                        alignLabelWithHint: true
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              const ChooseOptions(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Continue"),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}


