import 'package:flutter/material.dart';
import 'package:lipika/features/profile/ui/widgets/topic_selector.dart';

import '../../../../application/app_colors.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Personal Details"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 80,
                ),
              ),
              Form(
                child: Column(
                  spacing: 12,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Huda Enu",
                        labelText: "Full Name",
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "hasinulhuda@gmail.com",
                        labelText: "Email",
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Male",
                        labelText: "Gender",
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "01778778385",
                        labelText: "Phone",
                      ),
                    ),
                  ],
                ),
              ),
              const TopicSelector(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){},
                  child: const Text("Save"),
                ),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
