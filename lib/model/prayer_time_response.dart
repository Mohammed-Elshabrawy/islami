import 'package:json_annotation/json_annotation.dart';

part 'prayer_time_response.g.dart';

@JsonSerializable()
class PrayerTimeResponse {
  @JsonKey(name: "code")
  final int? code;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "data")
  final Data? data;

  PrayerTimeResponse ({
    this.code,
    this.status,
    this.data,
  });

  factory PrayerTimeResponse.fromJson(Map<String, dynamic> json) {
    return _$PrayerTimeResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PrayerTimeResponseToJson(this);
  }
}

@JsonSerializable()
class Data {
  @JsonKey(name: "timings")
  final Timings? timings;
  @JsonKey(name: "date")
  final Date? date;
  @JsonKey(name: "meta")
  final Meta? meta;

  Data ({
    this.timings,
    this.date,
    this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

@JsonSerializable()
class Timings {
  @JsonKey(name: "Fajr")
  final String? Fajr;
  @JsonKey(name: "Sunrise")
  final String? Sunrise;
  @JsonKey(name: "Dhuhr")
  final String? Dhuhr;
  @JsonKey(name: "Asr")
  final String? Asr;
  @JsonKey(name: "Sunset")
  final String? Sunset;
  @JsonKey(name: "Maghrib")
  final String? Maghrib;
  @JsonKey(name: "Isha")
  final String? Isha;
  @JsonKey(name: "Imsak")
  final String? Imsak;
  @JsonKey(name: "Midnight")
  final String? Midnight;
  @JsonKey(name: "Firstthird")
  final String? Firstthird;
  @JsonKey(name: "Lastthird")
  final String? Lastthird;

  Timings ({
    this.Fajr,
    this.Sunrise,
    this.Dhuhr,
    this.Asr,
    this.Sunset,
    this.Maghrib,
    this.Isha,
    this.Imsak,
    this.Midnight,
    this.Firstthird,
    this.Lastthird,
  });

  factory Timings.fromJson(Map<String, dynamic> json) {
    return _$TimingsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TimingsToJson(this);
  }
}

@JsonSerializable()
class Date {
  @JsonKey(name: "readable")
  final String? readable;
  @JsonKey(name: "timestamp")
  final String? timestamp;
  @JsonKey(name: "hijri")
  final Hijri? hijri;
  @JsonKey(name: "gregorian")
  final Gregorian? gregorian;

  Date ({
    this.readable,
    this.timestamp,
    this.hijri,
    this.gregorian,
  });

  factory Date.fromJson(Map<String, dynamic> json) {
    return _$DateFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DateToJson(this);
  }
}

@JsonSerializable()
class Hijri {
  @JsonKey(name: "date")
  final String? date;
  @JsonKey(name: "format")
  final String? format;
  @JsonKey(name: "day")
  final String? day;
  @JsonKey(name: "weekday")
  final Weekday? weekday;
  @JsonKey(name: "month")
  final Month? month;
  @JsonKey(name: "year")
  final String? year;
  @JsonKey(name: "designation")
  final Designation? designation;
  @JsonKey(name: "holidays")
  final List<String>? holidays;
  @JsonKey(name: "adjustedHolidays")
  final List<dynamic>? adjustedHolidays;
  @JsonKey(name: "method")
  final String? method;

  Hijri ({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.holidays,
    this.adjustedHolidays,
    this.method,
  });

  factory Hijri.fromJson(Map<String, dynamic> json) {
    return _$HijriFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HijriToJson(this);
  }
}

@JsonSerializable()
class Weekday {
  @JsonKey(name: "en")
  final String? en;
  @JsonKey(name: "ar")
  final String? ar;

  Weekday ({
    this.en,
    this.ar,
  });

  factory Weekday.fromJson(Map<String, dynamic> json) {
    return _$WeekdayFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WeekdayToJson(this);
  }
}

@JsonSerializable()
class Month {
  @JsonKey(name: "number")
  final int? number;
  @JsonKey(name: "en")
  final String? en;
  @JsonKey(name: "ar")
  final String? ar;
  @JsonKey(name: "days")
  final int? days;

  Month ({
    this.number,
    this.en,
    this.ar,
    this.days,
  });

  factory Month.fromJson(Map<String, dynamic> json) {
    return _$MonthFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MonthToJson(this);
  }
}

@JsonSerializable()
class Designation {
  @JsonKey(name: "abbreviated")
  final String? abbreviated;
  @JsonKey(name: "expanded")
  final String? expanded;

  Designation ({
    this.abbreviated,
    this.expanded,
  });

  factory Designation.fromJson(Map<String, dynamic> json) {
    return _$DesignationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DesignationToJson(this);
  }
}

@JsonSerializable()
class Gregorian {
  @JsonKey(name: "date")
  final String? date;
  @JsonKey(name: "format")
  final String? format;
  @JsonKey(name: "day")
  final String? day;
  @JsonKey(name: "weekday")
  final Weekday? weekday;
  @JsonKey(name: "month")
  final Month? month;
  @JsonKey(name: "year")
  final String? year;
  @JsonKey(name: "designation")
  final Designation? designation;
  @JsonKey(name: "lunarSighting")
  final bool? lunarSighting;

  Gregorian ({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.lunarSighting,
  });

  factory Gregorian.fromJson(Map<String, dynamic> json) {
    return _$GregorianFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GregorianToJson(this);
  }
}




@JsonSerializable()
class Meta {
  @JsonKey(name: "latitude")
  final double? latitude;
  @JsonKey(name: "longitude")
  final double? longitude;
  @JsonKey(name: "timezone")
  final String? timezone;
  @JsonKey(name: "method")
  final Method? method;
  @JsonKey(name: "latitudeAdjustmentMethod")
  final String? latitudeAdjustmentMethod;
  @JsonKey(name: "midnightMode")
  final String? midnightMode;
  @JsonKey(name: "school")
  final String? school;


  Meta ({
    this.latitude,
    this.longitude,
    this.timezone,
    this.method,
    this.latitudeAdjustmentMethod,
    this.midnightMode,
    this.school,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return _$MetaFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetaToJson(this);
  }
}

@JsonSerializable()
class Method {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "params")
  final Params? params;
  @JsonKey(name: "location")
  final Location? location;

  Method ({
    this.id,
    this.name,
    this.params,
    this.location,
  });

  factory Method.fromJson(Map<String, dynamic> json) {
    return _$MethodFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MethodToJson(this);
  }
}

@JsonSerializable()
class Params {
  @JsonKey(name: "Fajr")
  final double? Fajr;
  @JsonKey(name: "Isha")
  final double? Isha;

  Params ({
    this.Fajr,
    this.Isha,
  });

  factory Params.fromJson(Map<String, dynamic> json) {
    return _$ParamsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ParamsToJson(this);
  }
}

@JsonSerializable()
class Location {
  @JsonKey(name: "latitude")
  final double? latitude;
  @JsonKey(name: "longitude")
  final double? longitude;

  Location ({
    this.latitude,
    this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LocationToJson(this);
  }
}




