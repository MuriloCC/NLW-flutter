import 'package:flutter/material.dart';
import 'package:nlw_flutter/shared/models/boleto_model.dart';
import 'package:nlw_flutter/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:nlw_flutter/shared/widgets/boleto_tile/boleto_tile_widget.dart';

class BoletoListWidget extends StatefulWidget {
  final BoletoListController controller;
  const BoletoListWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  State<BoletoListWidget> createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
        valueListenable: widget.controller.boletosNotifier,
        builder: (_, boletos, __) => Column(
              children: boletos.map((e) => BoletoTile(data: e)).toList(),
            ));
  }
}
