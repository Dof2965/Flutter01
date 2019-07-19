import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  Event(
      this.event_id,
      this.title,
      this.catchcopy,
      this.description,
      this.event_url,
      this.hash_tag,
      this.started_at,
      this.ended_at,
      this.limit,
      this.event_type,
      this.address,
      this.place,
      this.owner_id,
      this.owner_nickname,
      this.owner_display_name,
      this.accepted,
      this.waiting,
      this.updated_at);
  // ignore: non_constant_identifier_names
  int event_id;
  String title;
  String catchcopy;
  String description;
  // ignore: non_constant_identifier_names
  String event_url;
  // ignore: non_constant_identifier_names
  String hash_tag;
  // ignore: non_constant_identifier_names
  String started_at;
  // ignore: non_constant_identifier_names
  String ended_at;
  int limit;
  // ignore: non_constant_identifier_names
  String event_type;
  // series 後でクラス作成。
  String address;
  String place;
  // 開催会場の緯度
  // double lat;
  // 開催会場の経度
  // double lon;
  // ignore: non_constant_identifier_names
  int owner_id;
  // ignore: non_constant_identifier_names
  String owner_nickname;
  // ignore: non_constant_identifier_names
  String owner_display_name;
  int accepted;
  int waiting;
  // ignore: non_constant_identifier_names
  String updated_at;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
