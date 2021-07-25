import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sabka_kirana/common/extensions/text_editing_value_extensions.dart';

class PhoneNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue _, TextEditingValue newValue) {
    return newValue.getFormattedPhoneNumber;
  }
}
