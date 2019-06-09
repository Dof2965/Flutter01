import 'package:json_annotation/json_annotation.dart';

part 'events.g.dart';

@JsonSerializable()
class Events {
  Events(
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
  int event_id;
  String title;
  String catchcopy;
  String description;
  String event_url;
  String hash_tag;
  String started_at;
  String ended_at;
  int limit;
  String event_type;
  // series 後でクラス作成。
  String address;
  String place;
  // 開催会場の緯度
  // double lat;
  // 開催会場の経度
  // double lon;
  int owner_id;
  String owner_nickname;
  String owner_display_name;
  int accepted;
  int waiting;
  String updated_at;

  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);
  Map<String, dynamic> toJson() => _$EventsToJson(this);
}
