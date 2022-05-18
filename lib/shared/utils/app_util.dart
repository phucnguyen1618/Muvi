import 'package:intl/intl.dart';

class AppUtils {
  static DateTime formatterDateTime(String date) {
    return DateFormat.yMd().parse(date);
  }
}
