import 'package:junkiri/models/step.dart';

class Achaar {
  late String name;
  late List<String> groceries;
  late Map<int, Step> steps;

  Achaar({required this.name, required this.groceries, required this.steps});

  Map<String, dynamic> toMap() =>
      {"name": name, "groceries": groceries, "steps": steps};

  Achaar.fromMap(Map<String, dynamic> map) {
    name = map["name"];
    groceries = List.from(map["groceries"]);
    steps = Map<int, Step>();
    Map.from(map["steps"]).entries.forEach((element) {
      steps.putIfAbsent(
          int.parse(element.key), () => Step.fromJson(element.value));
    });
  }
}
