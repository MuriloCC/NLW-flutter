import 'package:flutter/material.dart';
import 'package:nlw_flutter/shared/themes/app_colors.dart';
import 'package:nlw_flutter/shared/themes/app_text_styles.dart';
import 'package:nlw_flutter/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:nlw_flutter/shared/widgets/boleto_list/boleto_list_widget.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  State<ExtractPage> createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  final BoletoListController controller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Row(
                children: [
                  Text(
                    'Meus Extratos',
                    style: AppTextStyle.titleBoldHeading,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: Divider(
                color: AppColors.stroke,
                thickness: 1,
                height: 1,
              ),
            ),
            BoletoListWidget(controller: controller)
          ],
        ),
      ),
    );
  }
}
