// ignore_for_file: constant_identifier_names

import 'package:intl/intl.dart';

enum TypeFormat {
  yyyyMMMdd,
  ddMMyyyyHHmm,
  HHmm,
  HHmmNF,
  ddMMyyyy,
  EEEEMMMMdyyyy,
  ddMMyyyyHHmmText,
  yyyyMMdd,
  summary
}

enum LocationFormat { es, en }

class AppFormatters {
  AppFormatters._internal();
  static final AppFormatters _instance = AppFormatters._internal();
  static AppFormatters get instance => _instance;
  String dateFormatUtil({
    required DateTime dateTime,
    required TypeFormat typeFormat,
    LocationFormat locationFormat = LocationFormat.es,
  }) {
    var formatter = _generateFormat(typeFormat, locationFormat);
    String formatted = formatter.format(dateTime);
    return formatted;
  }

  String formatOnlyHours(String time) {
    var soloNumero = time.toString().split('T');
    var hora = soloNumero[1].split('.');
    var horaValor = hora[0];
    return horaValor;
  }

  String formatOnlyYear(String time) {
    var soloNumero = time.toString().split('T');
    var anio = soloNumero[0].split('.');
    var yearValor = anio[0];
    return yearValor;
  }

  String dateTimeFromString(String dateTime) {
    DateFormat inputFormat = DateFormat('dd/MM/yyyy hh:mm');
    DateTime date = inputFormat.parse(dateTime);
    //DateTime _date = inputFormat.parse(dateTime);
    String dayName = DateFormat('EEEE,', 'es_ES').format(date);
    String monthName = DateFormat('MMMM', 'es_ES').format(date);
    String data = "$dayName ${date.day} de $monthName de ${date.year}";
    return data;
  }

  DateFormat _generateFormat(
    TypeFormat typeFormat,
    LocationFormat locationFormat,
  ) {
    switch (typeFormat) {
      case TypeFormat.yyyyMMMdd:
        // something like 2019-Jun-20
        return DateFormat('yyyy-MMM-dd');
      case TypeFormat.ddMMyyyyHHmm:
        return DateFormat('dd/MM/yy , HH:mm a');
      case TypeFormat.HHmm:
        return DateFormat(
          'HH:mm a',
        );
      case TypeFormat.EEEEMMMMdyyyy:
        return DateFormat('EEEE, MMMM d', generateLocation(locationFormat));
      case TypeFormat.ddMMyyyyHHmmText:
        return DateFormat('EEEE, MMMM dd', generateLocation(locationFormat));
      case TypeFormat.ddMMyyyy:
        return DateFormat('dd/MM/yyyy');
      case TypeFormat.HHmmNF:
        return DateFormat('HH:mm a', generateLocation(locationFormat));
      case TypeFormat.yyyyMMdd:
        return DateFormat('yyyy-MM-dd');
      case TypeFormat.summary:
        return DateFormat('EEE dd MMM yyyy', generateLocation(locationFormat));
    }
  }

  String generateLocation(LocationFormat locationFormat) {
    switch (locationFormat) {
      case LocationFormat.es:
        return "es";
      case LocationFormat.en:
        return "en";
    }
  }

  String dateTimeFormatToShow(DateTime? openingDate) {
    if (openingDate == null) return '';
    return dateFormatUtil(
        dateTime: openingDate, typeFormat: TypeFormat.ddMMyyyy);
  }

  DateTime dateTimeStringToDateTime(String? openingDate) {
    if (openingDate == null) return DateTime.now();
    return DateTime.parse(openingDate);
  }

  /// convert String to Double
  double stringToDouble(String number) {
    double newDouble = 0.0;
    String newNumber = number;
    try {
      if (number.contains(',')) {
        newNumber = number.replaceAll(',', '.');
      }
      newDouble = double.parse(newNumber);
      return newDouble;
    } catch (_) {
      return 0;
    }
  }

  /// convert Double to String with 2 decimals and currency
  String doubleToStringCurrency(double number) {
    return '\$ ${number.toStringAsFixed(2)}';
  }

  /// convert String to String with 2 decimals and currency
  String stringToStringCurrency(String number) {
    return '\$ ${stringToDouble(number).toStringAsFixed(2)}';
  }

  String parseNumberFormat(String number) {
    String numberFormat =
        number.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
    return numberFormat;
  }

  String uuidToShortString(String uuid) {
    var paramUuid = uuid.split("-");
    return paramUuid[0];
  }
}
