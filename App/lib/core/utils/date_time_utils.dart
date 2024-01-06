import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const String DD_MM_YYYY = 'dd/MM/yyyy';

extension DateTimeExtension on DateTime {
  /// Return a string representing [date] formatted according to our locale
  String format([
    String pattern = DD_MM_YYYY,
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}

String formatDate(String input) {
  DateTime dateTime = DateTime.parse(input);
  String formattedDate = DateFormat('MMM d, yyyy').format(dateTime);
  return formattedDate;
}

String formatTime(String input) {
  DateTime dateTime = DateTime.parse(input);
  String formattedTime = DateFormat('h:mm a').format(dateTime);
  return formattedTime;
}
