import 'datum.dart';

class ListDataModel {
  int? success;
  List<Datum>? data;

  ListDataModel({this.success, this.data});

  factory ListDataModel.fromJson(Map<String, dynamic> json) => ListDataModel(
        success: json['success'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
