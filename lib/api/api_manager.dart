import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/prayer_time_response.dart';
import '../model/radio_response.dart';
import '../model/reciter_response.dart';
import 'api_consts.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: ApiConsts.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET(ApiConsts.prayerTimeEndpoint)
  Future<PrayerTimeResponse> getPrayerTimes(
    @Query('date') String date,
    @Query('latitude') String latitude,
    @Query('longitude') String longitude,
  );
}

@RestApi(baseUrl: ApiConsts.radioBaseUrl)
abstract class RadioApi {
  factory RadioApi(Dio dio, {String? baseUrl}) = _RadioApi;

  @GET(ApiConsts.radioEndpoint)
  Future<RadioResponse> getRadios(@Query('language') String language);

  @GET(ApiConsts.recitersEndpoint)
  Future<RecitersResponse> getReciters(@Query('language') String language);
}
