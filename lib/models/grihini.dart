class Grihini {
  final String uid;
  final String name;
  final String phoneNumber;
  final String address;
  final String status;
  final String completedTasks;
  final String pendingTasks;

  Grihini(
      {required this.completedTasks,
      required this.pendingTasks,
      required this.uid,
      required this.name,
      required this.phoneNumber,
      required this.address,
      required this.status});

  Grihini.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        phoneNumber = data['phoneNumber'],
        address = data['address'],
        status = data['status'],
        uid = data['uid'],
        completedTasks = data['address'],
        pendingTasks = data['status'];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'status': status,
      'uid': uid,
      'completedTasks': phoneNumber,
      'pendingTasks': address,
    };
  }
}
