import 'package:flutter/material.dart';
import 'package:retsept/app.dart';
import 'package:retsept/src/core/service_loactor.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();

  runApp(const MyApp());
}


