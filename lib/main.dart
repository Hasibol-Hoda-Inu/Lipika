import 'package:flutter/material.dart';
import 'package:lipika/application/app_providers.dart';

import 'application/app.dart';

void main(){
  runApp(
      AppProviders(
          child: Lipika()
      )
  );
}