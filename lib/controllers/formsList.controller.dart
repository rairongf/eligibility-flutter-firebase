import 'package:eligibility_flutter_firebase/entities/eligibilityForm.entity.dart';

import '../repositories/eligibilityForms.repository.dart';

class EligibilityFormsListController {
  final EligibilityFormsRepository repository;
  late final List<EligibilityForm> formsList;

  EligibilityFormsListController(this.repository);

  Future<void> initialize() async {
    final formsJsonList = await repository.getFormsJsonList();
    await repository.storeDocsOnCollection(formsJsonList, 'forms');
    formsList = await repository.queryDocsFromCollection('forms');
  }
}
