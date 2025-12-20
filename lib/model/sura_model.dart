import 'sura_list/sura_list.dart';

class Sura {
  String suraArabicName, suraEnglishName, suraAyaNumber;
  Sura({
    required this.suraArabicName,
    required this.suraAyaNumber,
    required this.suraEnglishName,
  });

 static List<Sura> createQuran() {
     List<Sura> list = [];
    for (int i = 0; i < SuraList.arabicQuranSuras.length; i++) {
      list.add(
        Sura(
          suraArabicName: SuraList.arabicQuranSuras[i],
          suraAyaNumber: SuraList.ayaNumber[i],
          suraEnglishName: SuraList.englishQuranSuras[i],
        ),
      );
    }
    return list;
  }

}
