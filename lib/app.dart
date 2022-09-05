import 'package:flutter/material.dart';
import 'pages/formsList.page.dart';

class EligibilityFormsList extends StatelessWidget {
  const EligibilityFormsList({Key? key}) : super(key: key);
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
