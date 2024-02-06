getTimeString(String str) {
  // 2024-01-24T00:43:08.447818+08:00 格式化 YYYY-MM-DD HH:mm:ss
  var time = DateTime.parse(str);
  var year = time.year.toString();
  var month = time.month.toString().padLeft(2, '0');
  var day = time.day.toString().padLeft(2, '0');
  var hour = time.hour.toString().padLeft(2, '0');
  var minute = time.minute.toString().padLeft(2, '0');
  var second = time.second.toString().padLeft(2, '0');
  return "$year-$month-$day $hour:$minute:$second";
}
