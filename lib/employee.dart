import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee {
  Employee(this.id, this.firstName, this.lastName);

  int id;
  String firstName;
  String lastName;
  
  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
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