import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sabka_kirana/common/constants/regex_constants.dart';
import 'package:sabka_kirana/common/libraries/screen_utils/screen_utils.dart';
import 'package:sabka_kirana/presentation/widgets/phone_number_widget/phone_number_text_input_formatter.dart';
import 'package:sabka_kirana/presentation/widgets/phone_number_widget/phone_prefix_icon.dart';

class PhoneNumberInputWidget extends StatefulWidget {
  final TextEditingController textEditingController;

  const PhoneNumberInputWidget({
    Key key,
    @required this.textEditingController,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PhoneNumberInputWidgetState();
  }
}

class PhoneNumberInputWidgetState extends State<PhoneNumberInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.h,
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          PhoneNumberTextInputFormatter(),
        ],
        maxLength: 12,
        style: Theme.of(context).textTheme.headline6.copyWith(height: 1.35),
        controller: widget.textEditingController,
        onChanged: (String value) {},
        autofocus: true,
        validator: (String value) {
          if (value == null ||
              value.isEmpty ||
              !RegExp(RegexConstants.validPhoneRegex).hasMatch(value
                  .trim()
                  .replaceAll(RegexConstants.hasSpaceCharacter, ''))) {
            return 'Invalid number';
          }
          return null;
        },
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.only(bottom: 2.25),
          hintText: 'Phone Number',
          filled: true,
          fillColor: Colors.white,
          counterText: '',
          prefixIcon: const PhonePrefixIcon(),
        ),
      ),
    );
  }
}
