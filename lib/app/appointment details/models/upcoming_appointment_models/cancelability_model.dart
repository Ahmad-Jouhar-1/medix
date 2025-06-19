class CancelabilityModel {
  final bool isCancelable;

  CancelabilityModel({required this.isCancelable});

  factory CancelabilityModel.fromJson(Map<String, dynamic> jsonData) {
    return CancelabilityModel(isCancelable: jsonData["is_cancelable"]);
  }
}
