// enum OrderStatus { CREATED, GROCERY_DROP_OFF, TIE_HAIR, READY_FOR_PICKUP }

class Task {
  final String jobId;
  final int orderStatus;
  final int amount;
  final String groceryList;
  final String achaarType;
  final String pickedBy;
  final String paymentStatus;

  Task(
      {required this.jobId,
      required this.orderStatus,
      required this.amount,
      required this.groceryList,
      required this.achaarType,
      required this.pickedBy,
      required this.paymentStatus});

  Task.fromMap(Map<String, dynamic> data)
      : jobId = data['jobId'],
        orderStatus = data['status'],
        amount = data['amount'],
        groceryList = data['groceryList'],
        achaarType = data['achaarType'],
        pickedBy = data['pickedBy'],
        paymentStatus = data['achaarType'];

  Map<String, dynamic> toMap() {
    return {
      'jobId': jobId,
      'orderStatus': orderStatus,
      'amount': amount,
      'groceryList':groceryList,
      'achaarType': achaarType,
      'pickedBy': pickedBy,
      'paymentStatus': paymentStatus
    };
  }
}
