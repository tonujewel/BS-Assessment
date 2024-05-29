class AppUtils {
  AppUtils._();
  static String getDateTime(String date) {
    DateTime tempDate = DateTime.parse(date);

    return "${tempDate.day} - ${tempDate.month} - ${tempDate.year}";
  }
}
