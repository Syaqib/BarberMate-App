import 'package:flutter/material.dart';
import 'package:my_app/Configs/service_locator.dart';
import 'package:provider/provider.dart';
import 'User_Profile/View_Model/userprofile_viewmodel.dart';
import 'app.dart';

void main() {
  initializeServiceLocator();
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProfileViewModel(),
      child: MyApp(),
    ),
  );
}

// call initialize service locator
