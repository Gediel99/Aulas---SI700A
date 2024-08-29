import 'package:aula4/view/screens/custom_text_form_Field.dart';
import 'package:aula4/view/screens/tip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SegundaTela extends StatefulWidget {
  Tip tip = Tip();
  SegundaTela({required this.tip, super.key});

  @override
  State<SegundaTela> createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  Tip tip = Tip();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            initialValue: tip.amount,
            keyboardType: TextInputType.number,
            onChanged: (value) => setState(() {
              tip.amount = value;
            }),
            decoration: const InputDecoration(labelText: 'Valor Total'),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))
            ],
            validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
          ),
        ),
        InputDecorator(
            decoration:
                const InputDecoration(labelText: 'Gorjeta,→ Customizada'),
            child: Slider(
              value: double.parse(tip.customTip),
              min: 1,
              max: 100,
              label: '${tip.defaultTip}%',
              onChanged: (double value) {
                setState(() {
                  tip.customTip = value.toString();
                });
              },
            )),
        Text('Gorjeta Customizada: ${tip.customTip}'),
        Text('Valor Total: ${tip.amount}'),
        Text('Gorjeta Padrão: ${tip.defaultTip}'),
        Text('Valor da Gorjeta Padrão: ${tip.defaultTippedAmount}'),
        Text(
            'Valor Total com Gorjeta Padrão: ${tip.amountPlusDefaultTippedAmount}'),
        Text('Valor da Gorjeta Customizada: ${tip.customTippedAmount}'),
        Text(
            'Valor Total com Gorjeta Customizada: ${tip.amountPlusCustomTippedAmount}'),
      ],
    );
  }
}
