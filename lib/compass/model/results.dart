import 'package:json_annotation/json_annotation.dart';
import 'event.dart';

part 'results.g.dart';

@JsonSerializable()
class Results {
  Results(this.results_returned, this.results_available, this.results_start,
      this.events);
  int results_returned;
  int results_available;
  int results_start;
  List<Event> events = <Event>[];

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
/*
please exec "flutter packages pub run build_runner build" after change code.

// ./lib/<CLASSNAME>.dart ファイル

import 'package:json_annotation/json_annotation.dart';

part '<CLASSNAME>.g.dart';

@JsonSerializable()
class <CLASSNAME> {
  <CLASSNAME>(<define params>);
    <define params>
  factory <CLASSNAME>.fromJson(Map<String, dynamic> json) => _$<CLASSNAME>FromJson(json);
  Map<String, dynamic> toJson() => _$<CLASSNAME>ToJson(this);
}

 */