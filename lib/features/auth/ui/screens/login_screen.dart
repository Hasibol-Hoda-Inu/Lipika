import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lipika/application/assets_path.dart';
import 'package:lipika/application/routes/app_route_const.dart';
import 'package:lipika/features/auth/ui/screens/sign_up_screen.dart';
import 'package:lipika/features/auth/ui/widgets/social_auth_buttons.dart';
import 'package:provider/provider.dart';

import '../../../common/ui/widgets/app_snackbar.dart';
import '../controllers/auth_controller.dart';

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
        title: Image.asset(AssetsPath.logo, height: 50),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                "Please Login to Continue",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 6),
              const Text(
                "You can log into your account first to read many interesting books",
              ),
              const SizedBox(height: 32),
              buildSignInForm(),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: Consumer<AuthController>(
                    builder: (context, controller, child) {
                      return ElevatedButton(
                      onPressed: controller.isLoading ? null : _login,
                      child: controller.isLoading ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ) : const Text("Login"),
                      );
                    }
                    ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Forgot your password? "),
                  TextButton(onPressed: () {}, child: const Text("Reset here")),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(child: Divider(endIndent: 10)),
                  Text("or"),
                  Expanded(child: Divider(indent: 10)),
                ],
              ),
              const SocialAuthButtons(googleButtonText: 'Login with Google',),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed: goToSignUpScreen,
                    child: const Text("Register here"),
                  ),
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your email";
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: "youremail@mail.com",
              labelText: "Email",
            ),
          ),
          TextFormField(
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your password";
              }
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              hintText: "input your password",
              labelText: "Password",
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    final String email = _emailController.text;
    final String password = _passwordController.text;

    final AuthController controller = context.read<AuthController>();

    final String? error = await controller.login(
      email: email,
      password: password,
    );

    if (!mounted) return;

    if (error != null) {
      AppSnackBar.show(
        context,
        message: error,
        type: SnackBarType.error,
      );
    }
  }

  void goToSignUpScreen(){
    GoRouter.of(context).pushReplacementNamed(AppRouteConst.signUpRouteName);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
