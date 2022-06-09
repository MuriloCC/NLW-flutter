import 'package:flutter/material.dart';
import 'package:nlw_flutter/shared/themes/app_colors.dart';
import 'package:nlw_flutter/shared/themes/app_text_styles.dart';
import 'package:nlw_flutter/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;

  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;

  final String title;
  final String subTitle;

  const BottomSheetWidget({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Material(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            Container(
              color: AppColors.shape,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: title,
                        style: AppTextStyle.buttonBoldHeading,
                        children: [
                          TextSpan(
                            text: "\n$subTitle",
                            style: AppTextStyle.buttonHeading,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    color: AppColors.stroke,
                  ),
                  SetLabelButtons(
                    primaryLabel: primaryLabel,
                    primaryOnPressed: primaryOnPressed,
                    secondaryLabel: secondaryLabel,
                    secondaryOnPressed: secondaryOnPressed,
                    enablePrimaryColor: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
