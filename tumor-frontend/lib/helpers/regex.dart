class RegexHelper {
  RegexHelper._();
  static final RegExp whiteSpace = RegExp(r'^$|\s+');
  static final RegExp fullname = RegExp(r'^[a-z A-Z,.\-]+$');
  static final RegExp numeric = RegExp(r'^-?[0-9]+$');
  static final RegExp emailType = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  static final RegExp dateFormat = RegExp(
      r'^\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$'); // YYYY-MM-DD
}