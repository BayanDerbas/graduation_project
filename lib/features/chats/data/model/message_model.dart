import 'package:graduation_project/features/officers/data/model/userOffice.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../Auth/data/model/user_model.dart';

part 'message_model.g.dart';

@JsonSerializable()
class Message {
  final int? id;
  final UserModel? sender;
  final String? content;
  final String? createdAt;

  Message({this.id, this.sender, this.content, this.createdAt});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
