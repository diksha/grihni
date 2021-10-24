class Grihini {
  final String name;
  final String phoneNumber;
  final String address;
  final String status;
  final String uid;
  final List<String> completedTasks;
  final List<String> pendingTasks;
  final String? profilePicture;

  Grihini({
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.status,
    required this.uid,
    required this.completedTasks,
    required this.pendingTasks,
    required this.profilePicture,
  });


  Grihini.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        phoneNumber = data['phoneNumber'],
        address = data['address'],
        status = data['status'],
        uid = data['uid'],
        completedTasks = List.from(data['completedTasks']),
        pendingTasks = List.from(data['pendingTasks']),
        profilePicture = data['profilePicture'];


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'status': status,
      'uid': uid,
      'completedTasks': completedTasks,
      'pendingTasks': pendingTasks,
      'profilePicture': profilePicture,
    };
  }
}
