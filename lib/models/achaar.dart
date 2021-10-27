import 'package:junkiri/models/step.dart';

class Achaar{
  final String name;
  final List<String> groceries;
  final List<Step> steps;


  Achaar({required this.name, required this.groceries,required this.steps});

  Map<String, dynamic> toMap() =>
      {
        "name": name,
        "groceries": groceries,
        "steps":steps
      };

  Achaar.fromMap(Map<dynamic, dynamic> map)
      : name = map["name"],
        groceries = map["groceries"],
        steps = map['steps'].map((step) {
          return Step.fromMap(step);
        });
}