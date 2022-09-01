import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'data_model.freezed.dart';
part 'data_model.g.dart';

@freezed
class DataModel with _$DataModel {
  const factory DataModel({
    int? id,
    String? title,
    String? worth,
    String? thumbnail,
    String? image,
    String? description,
    String? instructions,
    String? openGiveawayUrl,
    String? publishedDate,
    String? type,
    String? platforms,
    String? endDate,
    int? users,
    String? status,
    String? gamerpowerUrl,
    String? openGiveaway,
  }) = _DataModel;

  factory DataModel.fromJson(Map<String, Object?> json) =>
      _$DataModelFromJson(json);
}
