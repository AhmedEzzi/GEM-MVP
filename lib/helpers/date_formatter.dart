import 'package:gem_mvp/generated/localization.dart';

String eventDate(DateTime date) {
  // Get day in int format
  int day = date.day;

  // Determine suffix based on the day
  String suffix = "th";
  if (day == 1 || day == 21 || day == 31) {
    suffix = "st";
  } else if (day == 2 || day == 22) {
    suffix = "nd";
  } else if (day == 3 || day == 23) {
    suffix = "rd";
  }

  // Format the date
  String formattedDate =
      "${DateFormat('MMMM').format(date)} $day$suffix, ${date.year}";
  return formattedDate;
}
