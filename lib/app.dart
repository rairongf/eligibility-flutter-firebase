import 'package:flutter/material.dart';
import 'controllers/formsList.controller.dart';
import 'pages/formsList.page.dart';

class EligibilityFormsListApp extends StatelessWidget {
  final EligibilityFormsListController controller;
  const EligibilityFormsListApp(this.controller, {Key? key}) : super(key: key);
  final title = 'Eligibility Forms List';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormsListPage(controller),
    );
  }
}
