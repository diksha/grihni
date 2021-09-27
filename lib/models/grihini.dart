
class Grihini{
  final String name;
  final String phoneNumber;
  final String address;
  final String status;

  Grihini({required this.name,required this.phoneNumber, required this.address,required this.status});

  Grihini.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        phoneNumber = data['phoneNumber'],
        address = data['address'],
        status = data['status'];

  Map<String,dynamic> toMap(){
    return {
      'name' : name,
      'phoneNumber' : phoneNumber,
      'address' : address,
      'status' : status
    };
  }


}