import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:nlw_flutter/shared/models/boleto_model.dart';
import 'package:nlw_flutter/shared/themes/app_text_styles.dart';

class BoletoTile extends StatelessWidget {
  final BoletoModel data;
  const BoletoTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.name!,
          style: AppTextStyle.titleListTile,
        ),
        subtitle: Text(
          'Vence em ${data.dueDate}',
          style: AppTextStyle.captionBody,
        ),
        trailing: Text.rich(
          TextSpan(
            text: "R\$",
            style: AppTextStyle.trailingRegular,
            children: [
              TextSpan(text: data.value!.toStringAsFixed(2)),
            ],
          ),
        ),
      ),
    );
  }
}
