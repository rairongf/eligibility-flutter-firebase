class EligibilityForm {
  late final String uid;
  late final String _birthday;
  late final String name;
  late final int sex;
  late final String _eligibilityStatus;
  late final String _fillStatus;

  String get displayStatus {
    if (_fillStatus == 'partial') return 'Pendente';
    return isEligible ? 'Elegível' : 'Não elegível';
  }

  String get nameInitialLetters =>
      name.split(' ').map((namePart) => namePart[0].toUpperCase()).join();
  DateTime get birthdayDate => DateTime.parse(_birthday);
  int get age => (DateTime.now().difference(birthdayDate).inDays / 365).floor();
  bool get isMasculine => sex == 0;
  bool get isEligible => _eligibilityStatus == 'eligible';

  EligibilityForm.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    _birthday = json['birthday'];
    name = json['name'];
    sex = json['sex'];
    _eligibilityStatus = json['eligibilityStatus'];
    _fillStatus = json['fillStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid;
    data['birthday'] = _birthday;
    data['name'] = name;
    data['sex'] = sex;
    data['eligibilityStatus'] = _eligibilityStatus;
    data['fillStatus'] = _fillStatus;
    return data;
  }
}
