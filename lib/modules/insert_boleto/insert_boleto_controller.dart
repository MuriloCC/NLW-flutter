import 'package:flutter/widgets.dart';
import 'package:nlw_flutter/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();

  String? validateName(String? value) {
    return value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  }

  String? validateDataVencimento(String? value) {
    return value?.isEmpty ?? true
        ? "A data de nascimento não pode ser vazia"
        : null;
  }

  String? validateValor(double? value) {
    return value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
  }

  String? validateCodigo(String? value) {
    return value?.isEmpty ?? true ? "O código não pode ser vazio" : null;
  }

  void onChange({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    model = model.copyWith(
      name: name,
      dueDate: dueDate,
      value: value,
      barcode: barcode,
    );
  }

  Future<void> saveBoleto() async {
    final instance = await SharedPreferences.getInstance();
    final boletos = instance.getStringList("boletos") ?? <String>[];
    boletos.add(model.toJson());

    await instance.setStringList('boletos', boletos);
    return;
  }

  Future<void> cadastrarBoleto() async {
    final form = formKey.currentState;

    if (form!.validate()) {
      return await saveBoleto();
    }
  }
}
