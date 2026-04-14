import 'package:json_annotation/json_annotation.dart';

part 'radio_response.g.dart';

@JsonSerializable()
class RadioResponse {
  @JsonKey(name: "radios")
  final List<Radios>? radios;

  RadioResponse ({
    this.radios,
  });

  factory RadioResponse.fromJson(Map<String, dynamic> json) {
    return _$RadioResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RadioResponseToJson(this);
  }
}

@JsonSerializable()
class Radios {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "url")
  final String? url;

  Radios ({
    this.id,
    this.name,
    this.url,
  });

  factory Radios.fromJson(Map<String, dynamic> json) {
    return _$RadiosFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RadiosToJson(this);
  }
}


