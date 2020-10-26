import 'package:travelog/classes/page.dart';

class Date {
  Date({
    this.initialDay,
    this.initialMonth,
    this.initialYear,
    this.finalDay,
    this.finalMonth,
    this.finalYear,
    this.pages,
  });
  final int initialDay;
  final int initialMonth;
  final int initialYear;
  final int finalDay;
  final int finalMonth;
  final int finalYear;
  final List<DiaryPage> pages;

  int getInitialDay() {
    return initialDay;
  }

  int getInitialMonth() {
    return initialMonth;
  }

  int getInitialYear() {
    return initialYear;
  }

  int getFinalDay() {
    return finalDay;
  }

  int getFinalMonth() {
    return finalMonth;
  }

  int getFinalYear() {
    return finalYear;
  }
}
