import 'package:aula6/bloc/auth_bloc_intro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_text_form_Field.dart';

class PrimeiraTela extends StatelessWidget {
  const PrimeiraTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
                onSaved: (value) =>
                    login = value ?? '', // Passando o onSaved aqui
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
                onSaved: (value) =>
                    senha = value ?? '', // Passando o onSaved aqui
              ),
              const SizedBox(height: 10),
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: []),
              const SizedBox(height: 10),
              BlocBuilder<AuthBlocIntro, AuthState>(
                builder: (BuildContext context, AuthState state) {
                  if (state is Unauthenticated) {
                    return Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              BlocProvider.of<AuthBlocIntro>(context).add(
                                LoginUser(username: login, password: senha),
                              );
                            }
                          },
                          child: const Text("Efetuar Login"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              BlocProvider.of<AuthBlocIntro>(context).add(
                                RegisterUser(username: login, password: senha),
                              );
                            }
                          },
                          child: const Text("Registrar Novo Usuário"),
                        )
                      ],
                    );
                  } else {
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthBlocIntro>(context).add(Logout());
                      },
                      child: const Text("Deslogar"),
                    );
                  }
                },
              )
            ],
          )),
    );
  }
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String login = "";
String senha = "";
