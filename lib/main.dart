import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transactions_list/app/transactions_list_app.dart';
import './di/injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  configureDependencies();
  runApp(const TransactionsListApp());
}
