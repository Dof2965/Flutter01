// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results(
      json['results_returned'] as int,
      json['results_available'] as int,
      json['results_start'] as int,
      (json['events'] as List)
          ?.map((e) =>
              e == null ? null : Event.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'results_returned': instance.results_returned,
      'results_available': instance.results_available,
      'results_start': instance.results_start,
      'events': instance.events
    };
