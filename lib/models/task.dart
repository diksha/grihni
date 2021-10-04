enum OrderStatus { CREATED, GROCERY_DROP_OFF, READY_FOR_PICKUP,ORDER_COMPLETED }

class Task {
  final String jobId;
  final OrderStatus orderStatus;
  final int amount;
  final List groceryList;
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
        orderStatus = OrderStatus.values.elementAt(data['orderStatus']),
        amount = data['amount'],
        groceryList = data['groceryList'],
        achaarType = data['achaarType'],
        pickedBy = data['pickedBy'],
        paymentStatus = data['paymentStatus'];

  Map<String, dynamic> toMap() {
    return {
      'jobId': jobId,
      'orderStatus': orderStatus.index,
      'amount': amount,
      'groceryList':groceryList,
      'achaarType': achaarType,
      'pickedBy': pickedBy,
      'paymentStatus': paymentStatus
    };
  }
}
