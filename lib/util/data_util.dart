String formatData(String date){
  final dateTime = DateTime.parse(date);
  final year = dateTime.year;
  final month = dateTime.month;
  final day = dateTime.day;

  return "$day/$month/$year";
}
