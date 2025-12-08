import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lipika/application/assets_path.dart';
import 'package:lipika/features/auth/ui/screens/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AssetsPath.logo),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32,),
              Text("Welcome back", style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 6,),
              const Text("You can log into your account first to read many interesting books"),
              const SizedBox(height: 32,),
              buildSignInForm(),
              const SizedBox(height: 40,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onCLickSignUpScreen,
                    style: ElevatedButton.styleFrom(),
                    child: const Text("Login"),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Forgot your password? "),
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
                  label: const Text("Login with Google"),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed: (){},
                    child: const Text("Register here"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Form buildSignInForm() {
    return Form(
              key: _formKey,
                child: Column(
                  spacing: 20,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter your email";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "youremail@mail.com",
                        labelText: "Email",
                      ),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter your password";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "input your password",
                        labelText: "Password",
                      ),
                    ),
              ],
            ));
  }
  void onCLickSignUpScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }
  void onTapNextScreen(){
    if(_formKey.currentState!.validate()){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
