import 'package:aula5/view/provider/sheets_provider.dart';
import 'package:aula5/view/screens/custom_text_form_field.dart';
import 'package:aula5/view/screens/feedback_screen.dart';
import 'package:flutter/material.dart';

class PrimeiraTela extends StatefulWidget {
  const PrimeiraTela({super.key});

  @override
  State<PrimeiraTela> createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _termAccepted = false;
  String? _selectedCategory;
  int _selectedRadio = 1;

  List<String> _collectUserData() {
    String nome = _controller1.text.trim();
    String email = _controller2.text.trim();
    String preferenciaContato = _selectedRadio == 1 ? 'Email' : 'Telefone';
    String termosAceitos = _termAccepted ? 'Aceitou' : 'Não aceitou';
    String categoria = _selectedCategory ?? 'Sem categoria';

    return [nome, email, preferenciaContato, termosAceitos, categoria];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(controlller: _controller1, labelText: 'Nome'),
            const SizedBox(height: 10),
            CustomTextFormField(controlller: _controller2, labelText: 'Email'),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButtonFormField(
                value: _selectedCategory,
                hint: const Text("Selecione uma categoria"),
                items:
                    ['Dúvida', 'Sugestão', 'Reclamação'].map((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Método de contato preferencial:"),
                ),
                RadioListTile(
                  title: const Text("Email"),
                  value: 1,
                  groupValue: _selectedRadio,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Telefone"),
                  value: 2,
                  groupValue: _selectedRadio,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            CheckboxListTile(
              title: const Text('Aceito os termos de uso'),
              value: _termAccepted,
              onChanged: (bool? value) {
                setState(() {
                  _termAccepted = value ?? false;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  // Coletar os dados do usuário
                  List<String> userData = _collectUserData();

                  // Enviar dados para o banco de dados ou API
                  Future<String?> futureResult =
                      SheetsDatabase.helper.submitData(userData);

                  // Mostrar o resultado em um BottomSheet
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        color: Colors.grey[900], // Fundo da BottomSheet
                        child: FeedbackScreen(futureResult: futureResult),
                      );
                    },
                  );
                }
              },
              child: const Text('Enviar'),
            )
          ],
        ),
      ),
    );
  }
}
