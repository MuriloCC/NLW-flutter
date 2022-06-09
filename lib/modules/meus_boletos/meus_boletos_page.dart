import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:nlw_flutter/shared/models/boleto_model.dart';
import 'package:nlw_flutter/shared/themes/app_colors.dart';
import 'package:nlw_flutter/shared/themes/app_text_styles.dart';
import 'package:nlw_flutter/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:nlw_flutter/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:nlw_flutter/shared/widgets/boleto_list/boleto_list_widget.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({Key? key}) : super(key: key);

  @override
  State<MeusBoletosPage> createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 80,
            child: Stack(
              children: [
                Container(
                  color: AppColors.primary,
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ValueListenableBuilder<List<BoletoModel>>(
                    valueListenable: controller.boletosNotifier,
                    builder: (_, boletos, __) => AnimatedCard(
                        direction: AnimatedCardDirection.top,
                        child: BoletoInfoWidget(size: boletos.length)),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Row(
                    children: [
                      Text(
                        'Meus Boletos',
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
          )
        ],
      ),
    );
  }
}
