import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../entities/eligibilityForm.entity.dart';

class EligibilityFormListItem extends StatelessWidget {
  final EligibilityForm form;
  const EligibilityFormListItem(this.form, {Key? key}) : super(key: key);

  Color _getStatusColor() {
    if (form.displayStatus == 'Pendente') {
      return const Color.fromARGB(255, 255, 161, 19);
    }
    if (form.displayStatus == 'Elegível') {
      return const Color.fromRGBO(65, 178, 84, 1);
    }
    return const Color.fromRGBO(233, 47, 72, 1);
  }

  IconData _getStatusIcon() {
    if (form.displayStatus == 'Pendente') {
      return Icons.pending_actions_rounded;
    }
    if (form.displayStatus == 'Elegível') {
      return Icons.inventory_rounded;
    }
    return Icons.assignment_late_outlined;
  }

  String _getFormattedBirthdayDate() =>
      DateFormat('d MMMM yyyy', 'pt_BR').format(form.birthdayDate);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: Color.fromRGBO(235, 235, 235, 1),
          )),
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.4),
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        title: RichText(
            text: TextSpan(
          text: 'Nasceu em ',
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
          children: [
            TextSpan(
                text: _getFormattedBirthdayDate(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                )),
          ],
        )),
        subtitle:
            Text('${form.age} anos • ${form.isMasculine ? 'Homem' : 'Mulher'}',
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                )),
        leading: Text(form.nameInitialLetters,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            )),
        trailing: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _getStatusColor(),
                borderRadius: BorderRadius.circular(999999),
              ),
              child: Icon(
                _getStatusIcon(),
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Text(form.displayStatus,
                style: TextStyle(
                  color: _getStatusColor(),
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                )),
          ],
        ),
        horizontalTitleGap: 4,
        tileColor: const Color.fromRGBO(245, 245, 245, 1),
      ),
    );
  }
}
