import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  @JsonKey(name: "userId")
  final int createdBy;
  final int id;
  final String title;
  final String body;

  Post(
    this.createdBy,
    this.id,
    this.title,
    this.body,
  );

  factory Post.fromJson(json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
