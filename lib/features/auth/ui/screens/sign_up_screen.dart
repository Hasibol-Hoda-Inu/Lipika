import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lipika/application/app_colors.dart';
import 'package:lipika/features/auth/ui/utils/regex_validators.dart';

import '../../../../application/assets_path.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
            height: 30,
            child: SvgPicture.asset(AssetsPath.logo)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32,),
              Text("Create your account", style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 6,),
              const Text("Create a new account so you can read lots of interesting books"),
              const SizedBox(height: 32,),
              buildSignUpForm(),
              const SizedBox(height: 40,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(),
                  child: const Text("Sign up"),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Forgot your password?"),
                  TextButton(
                    onPressed: (){},
                    child: const Text("Reset here"),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      endIndent: 10,
                    ),
                  ),
                  Text("or"),
                  Expanded(
                      child: Divider(
                        indent: 10,
                      ))
                ],
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  icon: SvgPicture.asset(AssetsPath.google, width: 28, height: 28,),
                  label: const Text("Sign up with Google"),
                ),
              ),
              const SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: "By continuing, you agree to our ",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextSpan(
                              text: "Terms of Services",
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.themeColor,
                                  fontWeight: FontWeight.w600
                              ),
                              recognizer: TapGestureRecognizer()..onTap = (){},
                            ),

                          ]
                      )),
                  RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Read our ",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.themeColor,
                                  fontWeight: FontWeight.w600
                              ),
                              recognizer: TapGestureRecognizer()..onTap = (){},
                            ),
                          ]
                      )),
                ],
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  Form buildSignUpForm() {
    return Form(
              key: _formKey,
                child: Column(
                  spacing: 20,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        hintText: "nick name",
                        labelText: "Name",
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter your email";
                        }else if(!value.validEmail()){
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "youremail@mail.com",
                        labelText: "Email",
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter your password";
                        }else if(value.length < 6){
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "input your password",
                        labelText: "Password",
                      ),
                    ),
                  ],
                ));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
