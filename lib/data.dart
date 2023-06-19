import 'package:intl/intl.dart';

class Event {
  String title;
  bool done;
  Event(this.title, this.done);
}

Map<String, List<Event>> dailyEvents = {
  "230619": [
    Event("윈드브레이커 일일퀘스트", false),
    Event("윈드브레이커 일일보스", false),
    Event("카데나 일일퀘스트", false),
    Event("카데나 일일보스", false),
    Event("팔라딘 일일보스", false),
    // 이벤트
    Event("이덴티스크 기본 탐험", false),
  ],
};

List<Event> getDailyEventsForDay(DateTime date) {
  String stringDate = getStringOfDate(date);
  return dailyEvents[stringDate] ?? [];
}

DateTime getDateOfString(String date) {
  return DateTime(
    int.parse("20${date.substring(0, 2)}"),
    int.parse(date.substring(2, 4)),
    int.parse(date.substring(4, 6)),
  );
}

String getStringOfDate(DateTime date) {
  return DateFormat('yyMMdd').format(date);
}

String addStringDate(String date, int duration) {
  DateTime day = getDateOfString(date);
  DateTime nextDay = day.add(Duration(days: duration));
  return getStringOfDate(nextDay);
}

addDailyEvents(DateTime date) {
  String stringDate = getStringOfDate(date);
  if (dailyEvents.containsKey(stringDate)) {
    return;
  } else {
    dailyEvents[stringDate] = [
      Event("윈드브레이커 일일퀘스트", false),
      Event("윈드브레이커 일일보스", false),
      Event("카데나 일일퀘스트", false),
      Event("카데나 일일보스", false),
      Event("팔라딘 일일보스", false),
      // 이벤트
      Event("이덴티스크 기본 탐험", false),
    ];
  }
}
