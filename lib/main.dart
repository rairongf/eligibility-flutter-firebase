import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:eligibility_flutter_firebase/repositories/eligibilityForms.repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'firebase_options.dart';
import 'app.dart';
import 'controllers/formsList.controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('pt_BR');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final httpClient = Dio();
  final storageClient = FirebaseFirestore.instance;
  final repository = EligibilityFormsRepository(httpClient, storageClient);
  final pageController = EligibilityFormsListController(repository);
  runApp(EligibilityFormsListApp(pageController));
}
