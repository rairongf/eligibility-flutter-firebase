import 'package:eligibility_flutter_firebase/widgets/form.item.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/formsList.controller.dart';
import '../entities/eligibilityForm.entity.dart';

class FormsListPage extends StatefulWidget {
  final EligibilityFormsListController controller;
  const FormsListPage(this.controller, {Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<FormsListPage> createState() => _FormsListPageState();
}

class _FormsListPageState extends State<FormsListPage> {
  EligibilityFormsListController get controller => widget.controller;
  List<EligibilityForm> filteredList = [];

  @override
  void initState() {
    controller.initialize().then((_) {
      setState(() {
        filteredList = controller.formsList;
      });
    });
    super.initState();
  }

  void _filterListByStatus(String status) {
    final updatedList =
        filteredList.where((form) => form.displayStatus == status).toList();
    setState(() {
      filteredList = updatedList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
            itemBuilder: (_, index) {
              if (filteredList.isEmpty) {
                return _buildLoadingListTile(context);
              }
              final form = filteredList[index];
              return EligibilityFormListItem(form);
            },
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemCount: filteredList.isEmpty ? 3 : filteredList.length),
      ),
    );
  }
}

Widget _buildLoadingListTile(BuildContext context) {
  return ListTile(
    title: Shimmer.fromColors(
      highlightColor: Colors.grey.shade300,
      baseColor: const Color.fromRGBO(242, 242, 242, 1),
      child: Container(
        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.6),
        height: 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(242, 242, 242, 1),
        ),
      ),
    ),
    subtitle: Shimmer.fromColors(
      highlightColor: Colors.grey.shade300,
      baseColor: const Color.fromRGBO(242, 242, 242, 1),
      child: Container(
        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.3),
        height: 12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(242, 242, 242, 1),
        ),
      ),
    ),
  );
}
