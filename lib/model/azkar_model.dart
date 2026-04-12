import 'dart:convert';
import 'package:flutter/services.dart';

class AzkarModel {
  AzkarModel({
    this.category,
    this.count,
    this.description,
    this.reference,
    this.content,
  });

  AzkarModel.fromJson(dynamic json) {
    category = _clean(json['category']);
    count = _clean(json['count']);
    description = _clean(json['description']);
    reference = _clean(json['reference']);
    content = _clean(json['content']);
  }

  String? category;
  String? count;
  String? description;
  String? reference;
  String? content;

  static String? _clean(dynamic val) {
    if (val == null) return null;
    String text = val.toString();

    // 1. Remove literal escaped sequences and actual whitespace chars
    text = text.replaceAll(RegExp(r'\\n|\\r|\\t|\n|\r|\t'), ' ');

    // 2. Remove messy artifacts: single quotes ('), double quotes ("), backslashes (\), brackets ([ ]), and standard commas (,)
    // Note: We use \x27 for single quote to avoid escaping issues in the string literal
    text = text.replaceAll(RegExp(r'[\x27\"\\\[\],]'), ' ');

    // 3. Collapse multiple spaces into one and trim
    text = text.replaceAll(RegExp(r'\s+'), ' ').trim();

    return text;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    map['count'] = count;
    map['description'] = description;
    map['reference'] = reference;
    map['content'] = content;
    return map;
  }

  static Future<List<AzkarModel>> getAzkar(String azkarType) async {
    var jsonContent = jsonDecode(
      await rootBundle.loadString("assets/files/azkar/azkar.json"),
    );

    List<dynamic> rawList = jsonContent[azkarType] ?? [];
    List<AzkarModel> azkar = [];

    for (var item in rawList) {
      if (item is List) {
        for (var nestedItem in item) {
          azkar.add(AzkarModel.fromJson(nestedItem));
        }
      } else if (item is Map) {
        azkar.add(AzkarModel.fromJson(item));
      }
    }

    return azkar;
  }
}
