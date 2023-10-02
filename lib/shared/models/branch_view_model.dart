class BranchViewModel {
  int? value;
  String? text;
  int? role;
  bool? selected;
  String? companyId;

  BranchViewModel(
      {this.value, this.text, this.role, this.selected, this.companyId});

  BranchViewModel.fromJson(final Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
    role = json['role'];
    selected = json['selected'];
    companyId = json['companyId'];
  }
}