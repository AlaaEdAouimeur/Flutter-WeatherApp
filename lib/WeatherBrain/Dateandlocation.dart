class date {

   DateTime now = new DateTime.now();
  List<String> months = [
    'NULL',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  int monthinnumber;
   void getdate(Datetype date){
   
    date.day = now.day;
    date.month = months[now.month];
    date.year = now.year;
   
  }
}
class Datetype {
  int day;
  int year;
  String month;
  Datetype(this.day,this.month,this.year);
}