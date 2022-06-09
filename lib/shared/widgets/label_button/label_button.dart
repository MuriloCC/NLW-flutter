import 'package:flutter/material.dart';
import 'package:nlw_flutter/shared/themes/app_text_styles.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  const LabelButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        child: Text(label, style: textStyle ?? AppTextStyle.buttonHeading),
      ),
    );
  }
}
