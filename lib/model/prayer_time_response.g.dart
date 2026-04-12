// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_time_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerTimeResponse _$PrayerTimeResponseFromJson(Map<String, dynamic> json) =>
    PrayerTimeResponse(
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrayerTimeResponseToJson(PrayerTimeResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  timings: json['timings'] == null
      ? null
      : Timings.fromJson(json['timings'] as Map<String, dynamic>),
  date: json['date'] == null
      ? null
      : Date.fromJson(json['date'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : Meta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'timings': instance.timings,
  'date': instance.date,
  'meta': instance.meta,
};

Timings _$TimingsFromJson(Map<String, dynamic> json) => Timings(
  Fajr: json['Fajr'] as String?,
  Sunrise: json['Sunrise'] as String?,
  Dhuhr: json['Dhuhr'] as String?,
  Asr: json['Asr'] as String?,
  Sunset: json['Sunset'] as String?,
  Maghrib: json['Maghrib'] as String?,
  Isha: json['Isha'] as String?,
  Imsak: json['Imsak'] as String?,
  Midnight: json['Midnight'] as String?,
  Firstthird: json['Firstthird'] as String?,
  Lastthird: json['Lastthird'] as String?,
);

Map<String, dynamic> _$TimingsToJson(Timings instance) => <String, dynamic>{
  'Fajr': instance.Fajr,
  'Sunrise': instance.Sunrise,
  'Dhuhr': instance.Dhuhr,
  'Asr': instance.Asr,
  'Sunset': instance.Sunset,
  'Maghrib': instance.Maghrib,
  'Isha': instance.Isha,
  'Imsak': instance.Imsak,
  'Midnight': instance.Midnight,
  'Firstthird': instance.Firstthird,
  'Lastthird': instance.Lastthird,
};

Date _$DateFromJson(Map<String, dynamic> json) => Date(
  readable: json['readable'] as String?,
  timestamp: json['timestamp'] as String?,
  hijri: json['hijri'] == null
      ? null
      : Hijri.fromJson(json['hijri'] as Map<String, dynamic>),
  gregorian: json['gregorian'] == null
      ? null
      : Gregorian.fromJson(json['gregorian'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DateToJson(Date instance) => <String, dynamic>{
  'readable': instance.readable,
  'timestamp': instance.timestamp,
  'hijri': instance.hijri,
  'gregorian': instance.gregorian,
};

Hijri _$HijriFromJson(Map<String, dynamic> json) => Hijri(
  date: json['date'] as String?,
  format: json['format'] as String?,
  day: json['day'] as String?,
  weekday: json['weekday'] == null
      ? null
      : Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
  month: json['month'] == null
      ? null
      : Month.fromJson(json['month'] as Map<String, dynamic>),
  year: json['year'] as String?,
  designation: json['designation'] == null
      ? null
      : Designation.fromJson(json['designation'] as Map<String, dynamic>),
  holidays: (json['holidays'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  adjustedHolidays: json['adjustedHolidays'] as List<dynamic>?,
  method: json['method'] as String?,
);

Map<String, dynamic> _$HijriToJson(Hijri instance) => <String, dynamic>{
  'date': instance.date,
  'format': instance.format,
  'day': instance.day,
  'weekday': instance.weekday,
  'month': instance.month,
  'year': instance.year,
  'designation': instance.designation,
  'holidays': instance.holidays,
  'adjustedHolidays': instance.adjustedHolidays,
  'method': instance.method,
};

Weekday _$WeekdayFromJson(Map<String, dynamic> json) =>
    Weekday(en: json['en'] as String?, ar: json['ar'] as String?);

Map<String, dynamic> _$WeekdayToJson(Weekday instance) => <String, dynamic>{
  'en': instance.en,
  'ar': instance.ar,
};

Month _$MonthFromJson(Map<String, dynamic> json) => Month(
  number: (json['number'] as num?)?.toInt(),
  en: json['en'] as String?,
  ar: json['ar'] as String?,
  days: (json['days'] as num?)?.toInt(),
);

Map<String, dynamic> _$MonthToJson(Month instance) => <String, dynamic>{
  'number': instance.number,
  'en': instance.en,
  'ar': instance.ar,
  'days': instance.days,
};

Designation _$DesignationFromJson(Map<String, dynamic> json) => Designation(
  abbreviated: json['abbreviated'] as String?,
  expanded: json['expanded'] as String?,
);

Map<String, dynamic> _$DesignationToJson(Designation instance) =>
    <String, dynamic>{
      'abbreviated': instance.abbreviated,
      'expanded': instance.expanded,
    };

Gregorian _$GregorianFromJson(Map<String, dynamic> json) => Gregorian(
  date: json['date'] as String?,
  format: json['format'] as String?,
  day: json['day'] as String?,
  weekday: json['weekday'] == null
      ? null
      : Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
  month: json['month'] == null
      ? null
      : Month.fromJson(json['month'] as Map<String, dynamic>),
  year: json['year'] as String?,
  designation: json['designation'] == null
      ? null
      : Designation.fromJson(json['designation'] as Map<String, dynamic>),
  lunarSighting: json['lunarSighting'] as bool?,
);

Map<String, dynamic> _$GregorianToJson(Gregorian instance) => <String, dynamic>{
  'date': instance.date,
  'format': instance.format,
  'day': instance.day,
  'weekday': instance.weekday,
  'month': instance.month,
  'year': instance.year,
  'designation': instance.designation,
  'lunarSighting': instance.lunarSighting,
};

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  timezone: json['timezone'] as String?,
  method: json['method'] == null
      ? null
      : Method.fromJson(json['method'] as Map<String, dynamic>),
  latitudeAdjustmentMethod: json['latitudeAdjustmentMethod'] as String?,
  midnightMode: json['midnightMode'] as String?,
  school: json['school'] as String?,
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'timezone': instance.timezone,
  'method': instance.method,
  'latitudeAdjustmentMethod': instance.latitudeAdjustmentMethod,
  'midnightMode': instance.midnightMode,
  'school': instance.school,
};

Method _$MethodFromJson(Map<String, dynamic> json) => Method(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  params: json['params'] == null
      ? null
      : Params.fromJson(json['params'] as Map<String, dynamic>),
  location: json['location'] == null
      ? null
      : Location.fromJson(json['location'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MethodToJson(Method instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'params': instance.params,
  'location': instance.location,
};

Params _$ParamsFromJson(Map<String, dynamic> json) => Params(
  Fajr: (json['Fajr'] as num?)?.toDouble(),
  Isha: (json['Isha'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ParamsToJson(Params instance) => <String, dynamic>{
  'Fajr': instance.Fajr,
  'Isha': instance.Isha,
};

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
