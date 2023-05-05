//%2d
String timeFormat(int number) {
  if (number < 10) {
    return '0$number';
  }
  return '$number';
}
