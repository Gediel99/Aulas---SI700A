import 'package:aula4/view/screens/custom_text_form_Field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PrimeiraTela extends StatefulWidget {
  const PrimeiraTela({super.key});

  @override
  State<PrimeiraTela> createState() => _PrimeiraTelaState();
}

final TextEditingController _controller1 = TextEditingController();
final TextEditingController _controller2 = TextEditingController();
final TextEditingController _controller3 = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _PrimeiraTelaState extends State<PrimeiraTela> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(controlller: _controller1, labelText: 'Nome'),
              const SizedBox(height: 10),
              CustomTextFormField(
                  controlller: _controller2, labelText: 'Email'),
              const SizedBox(height: 10),
              CustomTextFormField(
                  controlller: _controller3, labelText: 'Senha'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          )),
    );
  }
}
