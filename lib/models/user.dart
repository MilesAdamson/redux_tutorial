import 'package:json_annotation/json_annotation.dart';
import 'package:redux_tutorial/models/address.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String name;
  final String email;
  final Address address;
  final String phone;
  final String website;

  String get initials {
    final parts = name.split(" ");
    if (parts.length >= 2) {
      return "${parts.first[0]}${parts.last[0]}";
    }

    return parts.single[0];
  }

  User(
    this.id,
    this.name,
    this.email,
    this.address,
    this.phone,
    this.website,
  );

  factory User.fromJson(json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
