import 'dart:ui';

const appTextColor = Color.fromARGB(255, 220, 247, 222);
const appButtonColor = Color.fromARGB(255, 94, 105, 115);

// Ref: http://bizz84.github.io/2018/03/18/How-Fast-Is-Flutter.html
class TimerTextFormatter {
  static String format(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr.$hundredsStr';
  }
}