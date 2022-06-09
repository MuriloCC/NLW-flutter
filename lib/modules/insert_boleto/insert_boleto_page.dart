import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nlw_flutter/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:nlw_flutter/shared/themes/app_colors.dart';
import 'package:nlw_flutter/shared/themes/app_text_styles.dart';
import 'package:nlw_flutter/shared/widgets/input_text/input_text_widget.dart';
import 'package:nlw_flutter/shared/widgets/set_label_buttons/set_label_buttons.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  State<InsertBoletoPage> createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();

  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$",
    decimalSeparator: ',',
  );

  final dueDateInputTextController = MaskedTextController(mask: '00/00/0000');
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const BackButton(
          color: AppColors.input,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 83, left: 83, bottom: 24),
                child: Text(
                  'Preencha os dados do boleto',
                  style: AppTextStyle.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    InputTextWidget(
                      label: 'Nome do boleto',
                      icon: Icons.description_outlined,
                      onChanged: (value) {
                        controller.onChange(name: value);
                      },
                      validator: controller.validateName,
                    ),
                    InputTextWidget(
                      controller: dueDateInputTextController,
                      label: 'Vencimento',
                      icon: FontAwesomeIcons.circleXmark,
                      onChanged: (value) {
                        controller.onChange(dueDate: value);
                      },
                      validator: controller.validateDataVencimento,
                    ),
                    InputTextWidget(
                      controller: moneyInputTextController,
                      label: 'Valor',
                      icon: FontAwesomeIcons.wallet,
                      onChanged: (value) {
                        controller.onChange(
                            value: moneyInputTextController.numberValue);
                      },
                      validator: (_) => controller
                          .validateValor(moneyInputTextController.numberValue),
                    ),
                    InputTextWidget(
                      controller: barcodeInputTextController,
                      label: 'Código',
                      icon: FontAwesomeIcons.barcode,
                      onChanged: (value) {
                        controller.onChange(barcode: value);
                      },
                      validator: controller.validateCodigo,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: 'Cancelar',
        primaryOnPressed: () {
          Navigator.pop(context);
        },
        secondaryLabel: 'Cadastrar',
        secondaryOnPressed: () async {
          await controller.cadastrarBoleto();
          Navigator.pop(context);
        },
        enableSecondaryColor: true,
      ),
    );
  }
}
