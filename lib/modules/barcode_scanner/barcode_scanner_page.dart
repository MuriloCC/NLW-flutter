import 'package:flutter/material.dart';
import 'package:nlw_flutter/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:nlw_flutter/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:nlw_flutter/shared/themes/app_text_styles.dart';
import 'package:nlw_flutter/shared/widgets/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:nlw_flutter/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    print('Ativa as cameras');
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        print("tem barcode");
        Navigator.pushReplacementNamed(context, "/insert_boleto",
            arguments: controller.status.barcode);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                  child: controller.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                leading: const BackButton(
                  color: Colors.white,
                ),
                centerTitle: true,
                title: Text(
                  'Escaneie o código de barras do boleto',
                  style: AppTextStyle.buttonBackground,
                ),
                backgroundColor: Colors.black,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                primaryLabel: 'Inserir código do boleto',
                primaryOnPressed: () {
                  Navigator.pushReplacementNamed(context, "/insert_boleto");
                },
                secondaryLabel: 'Adicionar da galeria',
                secondaryOnPressed: () {},
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return BottomSheetWidget(
                  title: "Não foi possivel identificar um código de barras.",
                  subTitle:
                      "Tente escanear novamente ou digite o código do seu boleto",
                  primaryLabel: "Escanear Novamente",
                  primaryOnPressed: () {
                    controller.scanWithCamera();
                  },
                  secondaryLabel: "Digitar código",
                  secondaryOnPressed: () {
                    print('clickei');
                    Navigator.pushReplacementNamed(context, "/insert_boleto");
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
