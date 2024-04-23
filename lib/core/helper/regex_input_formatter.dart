import 'package:flutter/services.dart';

// ignore: unnecessary_string_escapes
const formatterRegex = '^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$';
const newFormatterRegexOnlyAcceptDot = r'^\d*\.?\d{0,2}';

class RegExInputFormatter implements TextInputFormatter {
  final RegExp _regExp;

  RegExInputFormatter._(this._regExp);

  factory RegExInputFormatter.withRegex(String regexString) {
    final regex = RegExp(regexString);
    return RegExInputFormatter._(regex);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final oldValueValid = _isValid(oldValue.text);
    final newValueValid = _isValid(newValue.text);
    if (oldValueValid && !newValueValid) {
      return oldValue;
    }
    return newValue;
  }

  bool _isValid(String value) {
    try {
      String truncated = value;
      if (value.contains(",")) {
        truncated = value.replaceFirst(RegExp(','), '.');
      }
      final matches = _regExp.allMatches(truncated);
      for (Match match in matches) {
        if (match.start == 0 && match.end == truncated.length) {
          return true;
        }
      }
      return false;
    } catch (e) {
      // Invalid regex
      assert(false, e.toString());
      return true;
    }
  }
}
