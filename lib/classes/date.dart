class Date {
  Date(
      {this.initialDay,
      this.initialMonth,
      this.initialYear,
      this.finalDay,
      this.finalMonth,
      this.finalYear});
  final int initialDay;
  final int initialMonth;
  final int initialYear;
  final int finalDay;
  final int finalMonth;
  final int finalYear;

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
