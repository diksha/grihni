
enum OrderStatus { CREATED, GROCERY_DROP_OFF,PREPARING, READY_FOR_PICKUP,ORDER_COMPLETED }

OrderStatus getOrderStatusEnum(String orderStatus) {
  switch (orderStatus) {
    case "CREATED":
      return OrderStatus.CREATED;
    case "GROCERY_DROP_OFF":
     return OrderStatus.GROCERY_DROP_OFF;
    case "PREPARING":
      return OrderStatus.PREPARING;
    case "READY_FOR_PICKUP":
      return OrderStatus.READY_FOR_PICKUP;
    case "ORDER_COMPLETED":
      return OrderStatus.ORDER_COMPLETED;
  }
  return OrderStatus.CREATED;
}

class Task {
  final String jobId;
  final OrderStatus orderStatus;
  final int amount;
  final List groceryList;
  final String achaarType;
  final String pickedBy;
  final String paymentStatus;
  final String docId;

  Task(
      {required this.jobId,
      required this.orderStatus,
      required this.amount,
      required this.groceryList,
      required this.achaarType,
      required this.pickedBy,
      required this.paymentStatus,
        required this.docId
      });

  Task.fromMap(Map<String, dynamic> data)
      : jobId = data['jobId'],
        orderStatus = getOrderStatusEnum(data['orderStatus']),
        amount = data['amount'],
        groceryList = data['groceryList'],
        achaarType = data['achaarType'],
        pickedBy = data['pickedBy'],
        paymentStatus = data['paymentStatus'],
  docId = data['docId'];


  Map<String, dynamic> toMap() {
    return {
      'jobId': jobId,
      'orderStatus': orderStatus,
      'amount': amount,
      'groceryList':groceryList,
      'achaarType': achaarType,
      'pickedBy': pickedBy,
      'paymentStatus': paymentStatus,
      'docId':docId
    };
  }
}
