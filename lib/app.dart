import 'package:flutter/material.dart';
import 'pages/controller.dart';
import 'pages/formsList.page.dart';

class EligibilityFormsListPage extends StatelessWidget {
  final EligibilityFormsListController controller;
  const EligibilityFormsListPage(this.controller, {Key? key}) : super(key: key);
  final title = 'Eligibility Forms List';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormsListPage(title: title),
    );
  }
}
