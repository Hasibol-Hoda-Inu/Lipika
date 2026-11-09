import 'package:flutter/material.dart';
import 'package:lipika/features/auth/ui/controllers/auth_controller.dart';
import 'package:lipika/features/auth/ui/controllers/auth_session_controller.dart';
import 'package:lipika/features/category/data/services/category_service.dart';
import 'package:lipika/features/category/ui/controllers/category_controller.dart';
import 'package:lipika/features/common/ui/controller/main_bottom_nav_provider.dart';
import 'package:lipika/features/my_books/data/services/book_service.dart';
import 'package:lipika/features/my_books/ui/controllers/book_controller.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../features/auth/data/services/auth_service.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>MainBottomNavProvider()),
        ChangeNotifierProvider(create: (context)=>AuthController(authService: AuthService())),
        ChangeNotifierProvider(create: (context)=>AuthSessionController(supabase: Supabase.instance.client)),
        ChangeNotifierProvider(create: (context)=>CategoryController(categoryService: CategoryService())),
        ChangeNotifierProvider(create: (context)=>BookController(bookService: BookService(supabase: Supabase.instance.client))),
      ],
      child: child, 
    );
  }
}