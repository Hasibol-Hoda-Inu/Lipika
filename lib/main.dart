import 'package:flutter/material.dart';
import 'package:lipika/application/appProviders.dart';

import 'application/app.dart';

void main(){
  runApp(
      AppProviders(
          child: Lipika()
      )
  );
}