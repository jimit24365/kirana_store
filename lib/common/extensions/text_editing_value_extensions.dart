import 'package:flutter/material.dart';

extension TextEditingValueExtensions on TextEditingValue {
  TextEditingValue get getFormattedPhoneNumber {
    const int firstSpaceCharacterIndex = 4;
    const int secondSpaceCharacterIndex = 8;
    final int newTextLength = text.length;

    int selectionIndex = selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();

    if (newTextLength >= firstSpaceCharacterIndex) {
      usedSubstringIndex = firstSpaceCharacterIndex - 1;
      newText.write('${text.substring(0, usedSubstringIndex)} ');

      if (selection.end >= firstSpaceCharacterIndex) {
        selectionIndex += 1;
      }
    }

    if (newTextLength >= secondSpaceCharacterIndex) {
      usedSubstringIndex = secondSpaceCharacterIndex - 1;
      const startIndex = firstSpaceCharacterIndex - 1;
      newText.write('${text.substring(startIndex, usedSubstringIndex)} ');
      if (selection.end >= secondSpaceCharacterIndex) {
        selectionIndex += 1;
      }
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex) {
      newText.write(text.substring(usedSubstringIndex));
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
