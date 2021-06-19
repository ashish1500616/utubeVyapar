// To parse this JSON data, do
//
//     final randomVideos = randomVideosFromMap(jsonString);

import 'dart:convert';

class Campaign {
  Campaign({
    required this.key,
    required this.uuid,
    required this.videoUrl,
  });

  String key;
  String uuid;
  String videoUrl;

  factory Campaign.fromJson(String str) => Campaign.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Campaign.fromMap(Map<String, dynamic> json) => Campaign(
        key: json["key"],
        uuid: json["uuid"],
        videoUrl: json["video_url"],
      );

  Map<String, dynamic> toMap() => {
        "key": key,
        "uuid": uuid,
        "video_url": videoUrl,
      };
}
