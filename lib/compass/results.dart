import 'package:json_annotation/json_annotation.dart';
import 'events.dart';

part 'results.g.dart';

@JsonSerializable()
class Results {
  Results(this.results_returned, this.results_available, this.results_start,
      this.events);
  int results_returned;
  int results_available;
  int results_start;
  List<Events> events = <Events>[];

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
