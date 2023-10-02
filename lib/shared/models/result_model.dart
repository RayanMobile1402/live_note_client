
class SuccessResultModel {
  int? status;
  bool? isSuccess;
  bool? isFailure;
  String? message;
  List<String>? messages;

  SuccessResultModel(
      {this.status,
        this.isSuccess,
        this.isFailure,
        this.message,
        this.messages});

  SuccessResultModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isSuccess = json['isSuccess'];
    isFailure = json['isFailure'];
    message = json['message'];
    messages = json['messages'].cast<String>();
  }
}