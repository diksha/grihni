class Grihini{
  final String name;
  final String phoneNumber;
  final String address;

  Grihini({required this.name,required this.phoneNumber, required this.address});

  Grihini.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        phoneNumber = data['phoneNumber'],
        address = data['address'];

  Map<String,dynamic> toMap(){
    return {
      'name' : name,
      'phoneNumber' : phoneNumber,
      'address' : address
    };
  }


}