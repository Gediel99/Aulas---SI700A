import 'package:aula6/bloc/auth_bloc_intro.dart';
import 'package:aula6/view/layout/my_bottom_navigation_bar.dart';
import 'package:aula6/view/layout/my_tab_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBlocIntro, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Erro de Autenticação"),
                  content: Text(state.message ?? 'Error'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("ok"),
                    )
                  ],
                );
              });
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return const MyBottomNavigationBar();
        } else {
          return const MyTabLayout();
        }
      },
    );
  }
}
