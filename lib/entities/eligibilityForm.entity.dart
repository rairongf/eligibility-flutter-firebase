class EligibilityForm {
  late final String uid;
  late final String birthday;
  late final String name;
  late final String sex;
  late final String _eligibilityStatus;
  late final String _fillStatus;

  String get displayStatus {
    if (_fillStatus == 'partial') return 'Pendente';
    return isEligible ? 'Elegível' : 'Não elegível';
  }

  bool get isEligible => _eligibilityStatus == 'eligible';

  EligibilityForm.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    birthday = json['birthday'];
    name = json['name'];
    sex = json['sex'];
    _eligibilityStatus = json['eligibilityStatus'];
    _fillStatus = json['fillStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid;
    data['birthday'] = birthday;
    data['name'] = name;
    data['sex'] = sex;
    data['eligibilityStatus'] = _eligibilityStatus;
    data['fillStatus'] = _fillStatus;
    return data;
  }
}
