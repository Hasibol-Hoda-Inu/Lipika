import 'package:flutter/material.dart';
import 'package:lipika/application/app_providers.dart';
import 'package:lipika/application/const/const.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'application/app.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: KeySup.url,
      publishableKey: KeySup.spPublishableKey,
  );

  runApp(
      const AppProviders(
          child: Lipika()
      )
  );
}