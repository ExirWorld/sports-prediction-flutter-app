extension ConvertEpoch on int {
/*
هست و در واقع تاریخ را به صورت عددی نمایش میدهد، عمل می کند int که یک عدد از نوع Timestamp این اکستنش بر روی
و نشان میدهد که از زمان اولیه تا زمان دوم، به تفکیک سال و روز و ماه و ساعت و دقیقه و ثانیه، چقدر گذشته است

نمونه خروجی:
"23 hour(s) 56 minute(s) 0 second(s)."

:Timestamp نمونه
1712997010

تبدیل کنیم DateTime رو به Timestamp البته باید قبلش به روش زیر:
var date = DateTime.fromMillisecondsSinceEpoch(
                              1712997010 * 1000);
*/

  String convertEpoch(DateTime from, DateTime to, String page) {
    from = DateTime(
        from.year, from.month, from.day, from.hour, from.minute, from.second);
    to = DateTime(to.year, to.month, to.day, to.hour, to.minute, from.second);
    Duration difference = to.difference(from);
    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;
    if (from.isAfter(to)) {
      return ("");
    } else {
      if (page == 'ThreePageTwo') {
        if (days != 0) {
          return ("باید به مدت $days روز و $hours ساعت و $minutes دقیقه و $seconds ثانیه دیگر از اولین واریز شما بگذرد.");
        } else if (hours != 0) {
          return ("باید به مدت $hours ساعت و $minutes دقیقه و $seconds ثانیه دیگر از اولین واریز شما بگذرد.");
        } else if (minutes != 0) {
          return ("باید به مدت $minutes دقیقه و $seconds ثانیه دیگر از اولین واریز شما بگذرد.");
        } else if (seconds != 0) {
          return ("باید به مدت $seconds ثانیه دیگر از اولین واریز شما بگذرد.");
        } else {
          return ("");
        }
      } else if (page == 'FourPageTwo') {
        if (days != 0) {
          return ("باید به مدت $days روز و $hours ساعت و $minutes دقیقه و $seconds ثانیه دیگر از سطح قبلی بگذرد.");
        } else if (hours != 0) {
          return ("باید به مدت $hours ساعت و $minutes دقیقه و $seconds ثانیه دیگر از سطح قبلی شما بگذرد.");
        } else if (minutes != 0) {
          return ("باید به مدت $minutes دقیقه و $seconds ثانیه دیگر از سطح قبلی شما بگذرد.");
        } else if (seconds != 0) {
          return ("باید به مدت $seconds ثانیه دیگر از سطح قبلی شما بگذرد.");
        } else {
          return ("");
        }
      } else {
        return ("");
      }
    }
  }
  // باید به مدت 2  ساعت و 40 دقیقه و 30 ثانیه  دیگر از اولین واریز شما بگذرد.

  // بر اساس تایپ، فقط بخشی از کل زمان که لازمه نمایش داده میشه
  int convertEpochOne(DateTime from, DateTime to, String type) {
    from = DateTime(
        from.year, from.month, from.day, from.hour, from.minute, from.second);
    to = DateTime(to.year, to.month, to.day, to.hour, to.minute, from.second);
    Duration difference = to.difference(from);
    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;
    if (type == 'days') {
      return days;
    } else if (type == 'hours') {
      return hours;
    } else if (type == 'minutes') {
      return minutes;
    } else if (type == 'seconds') {
      return seconds;
    } else {
      return 0;
    }
  }

  // بر اساس نوع تایپ؛ کل زمان را بر اساس نیاز به روز، ساعت، دقیقه و یا ثانیه نمایش می دهد
  int convertEpochTwo(DateTime from, DateTime to, String type) {
    from = DateTime(
        from.year, from.month, from.day, from.hour, from.minute, from.second);
    to = DateTime(to.year, to.month, to.day, to.hour, to.minute, from.second);
    Duration difference = to.difference(from);
    int days = difference.inDays;
    int hours = difference.inHours;
    int minutes = difference.inMinutes;
    int seconds = difference.inSeconds;
    if (type == 'days') {
      return days;
    } else if (type == 'hours') {
      return hours;
    } else if (type == 'minutes') {
      return minutes;
    } else if (type == 'seconds') {
      return seconds;
    } else {
      return 0;
    }
  }
}
