import 'package:flutter/material.dart';

import '../entities/eligibilityForm.entity.dart';

class EligibilityFormListItem extends StatelessWidget {
  final EligibilityForm form;
  const EligibilityFormListItem(this.form, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('Title'),
      subtitle: Text('Subtitle'),
      leading: Text('Leading'),
      trailing: Text('Trailing'),
    );
  }
}
