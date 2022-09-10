import 'package:eligibility_flutter_firebase/widgets/form.item.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/formsList.controller.dart';
import '../entities/eligibilityForm.entity.dart';

class FormsListPage extends StatefulWidget {
  final EligibilityFormsListController controller;
  const FormsListPage(this.controller, {Key? key}) : super(key: key);

  @override
  State<FormsListPage> createState() => _FormsListPageState();
}

class _FormsListPageState extends State<FormsListPage> {
  EligibilityFormsListController get controller => widget.controller;
  List<EligibilityForm> get filteredList => controller.formsList
      .where((form) => selectedStatus.contains(form.displayStatus))
      .toList();
  int numberOfVisibleElements = 15;
  List<String> selectedStatus = ['Elegível', 'Pendente', 'Não elegível'];

  @override
  void initState() {
    controller.initialize().then((_) {
      setState(() {});
    });
    super.initState();
  }

  void _filterListByStatus(String status) {
    final isAlreadySelected = selectedStatus.contains(status);
    if (selectedStatus.length == 1 && isAlreadySelected) return;
    final copy = selectedStatus;
    isAlreadySelected ? copy.remove(status) : copy.add(status);
    final newFilteredList = controller.formsList
        .where((form) => copy.contains(form.displayStatus))
        .toList();
    setState(() {
      selectedStatus = copy;
      numberOfVisibleElements = numberOfVisibleElements > newFilteredList.length
          ? newFilteredList.length
          : numberOfVisibleElements;
    });
  }

  void _viewMoreElements() {
    int updatedValue = numberOfVisibleElements + 15;
    if (updatedValue > filteredList.length) {
      updatedValue = filteredList.length;
    }
    setState(() {
      numberOfVisibleElements = updatedValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text('Formulários\nde Elegibilidade',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    )),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                    'Marque abaixo as opções de status que deseja visualizar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    )),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  _buildFilterOption(
                    text: 'Elegível',
                    onPressed: () => _filterListByStatus('Elegível'),
                    isSelected: selectedStatus.contains('Elegível'),
                  ),
                  const Spacer(),
                  _buildFilterOption(
                    text: 'Pendente',
                    onPressed: () => _filterListByStatus('Pendente'),
                    isSelected: selectedStatus.contains('Pendente'),
                  ),
                  const Spacer(),
                  _buildFilterOption(
                    text: 'Não elegível',
                    onPressed: () => _filterListByStatus('Não elegível'),
                    isSelected: selectedStatus.contains('Não elegível'),
                  ),
                  const Spacer(flex: 6),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    if (filteredList.isEmpty) {
                      return _buildLoadingListTile(context);
                    }
                    if (index == numberOfVisibleElements &&
                        numberOfVisibleElements != filteredList.length) {
                      return _buildViewMoreButton(
                        onPressed: _viewMoreElements,
                      );
                    }
                    final form = filteredList[index];
                    return EligibilityFormListItem(form);
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 3),
                  itemCount: filteredList.isEmpty
                      ? 7
                      : numberOfVisibleElements == filteredList.length
                          ? numberOfVisibleElements
                          : numberOfVisibleElements + 1),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildShimmerContainer(
  BuildContext context, {
  double height = 0,
  double width = 0,
  EdgeInsetsGeometry? margin,
}) {
  return Shimmer.fromColors(
    highlightColor: Colors.grey.shade300,
    baseColor: const Color.fromRGBO(242, 242, 242, 1),
    child: Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromRGBO(242, 242, 242, 1),
      ),
    ),
  );
}

Widget _buildLoadingListTile(BuildContext context) {
  return ListTile(
    leading: _buildShimmerContainer(context),
    title: _buildShimmerContainer(
      context,
      height: 15,
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.6),
    ),
    subtitle: _buildShimmerContainer(
      context,
      height: 12,
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.3),
    ),
  );
}

Widget _buildViewMoreButton({required VoidCallback onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 16)),
            backgroundColor: MaterialStateProperty.all(Colors.grey),
            elevation: MaterialStateProperty.all(8),
            shadowColor:
                MaterialStateProperty.all(Colors.black.withOpacity(0.4)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  width: 2,
                  color: Colors.grey.shade300,
                )))),
        icon: const Icon(
          Icons.arrow_downward_rounded,
          color: Colors.white,
          size: 30,
        ),
        label: const Text('Ver mais',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ))),
  );
}

Widget _buildFilterOption({
  required VoidCallback onPressed,
  required String text,
  bool isSelected = false,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (isSelected) ...[
            const SizedBox(width: 4),
            const Icon(
              Icons.done_rounded,
              color: Colors.green,
              size: 16,
            ),
          ],
        ],
      ),
    ),
  );
}
