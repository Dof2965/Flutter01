// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
      json['event_id'] as int,
      json['title'] as String,
      json['catch'] as String,
      json['description'] as String,
      json['event_url'] as String,
      json['hash_tag'] as String,
      json['started_at'] as String,
      json['ended_at'] as String,
      json['limit'] as int,
      json['event_type'] as String,
      json['address'] as String,
      json['place'] as String,
      json['owner_id'] as int,
      json['owner_nickname'] as String,
      json['owner_display_name'] as String,
      json['accepted'] as int,
      json['waiting'] as int,
      json['updated_at'] as String);
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'event_id': instance.event_id,
      'title': instance.title,
      'catch': instance.catchcopy,
      'description': instance.description,
      'event_url': instance.event_url,
      'hash_tag': instance.hash_tag,
      'started_at': instance.started_at,
      'ended_at': instance.ended_at,
      'limit': instance.limit,
      'event_type': instance.event_type,
      'address': instance.address,
      'place': instance.place,
      'owner_id': instance.owner_id,
      'owner_nickname': instance.owner_nickname,
      'owner_display_name': instance.owner_display_name,
      'accepted': instance.accepted,
      'waiting': instance.waiting,
      'updated_at': instance.updated_at
    };
