import 'package:flutter/material.dart';
import 'package:login_dos/providers/from_provider.dart';
import 'package:login_dos/ui/decoradores.dart';
import 'package:login_dos/widgets/fondoLogin.dart';
import 'package:login_dos/widgets/tarjeta_login.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FondoLogin(
              child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            TarjetaLogin(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Log in',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ChangeNotifierProvider(
                      create: (context) => FromProvider(),
                      child: const _FormLogin(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text('Or sign up with social account'),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                          width: 2, color: Color.fromRGBO(51, 49, 47, 0.8)),
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.facebook_rounded,
                      color: Color.fromRGBO(51, 49, 47, 0.8),
                    ),
                    label: const Text(
                      'Facebook',
                      style: TextStyle(color: Color.fromRGBO(51, 49, 47, 0.8)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                            width: 2, color: Color.fromRGBO(51, 49, 47, 0.8))),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.android,
                      color: Color.fromRGBO(51, 49, 47, 0.8),
                    ),
                    label: const Text('Android',
                        style:
                            TextStyle(color: Color.fromRGBO(51, 49, 47, 0.8))),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
              ],
            ),
            SizedBox(height: 50)
          ],
        ),
      ))),
    );
  }
}

class _FormLogin extends StatelessWidget {
  const _FormLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formService = Provider.of<FromProvider>(context);
    return Form(
      key: formService.formKey,
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) => formService.email = value,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: Decoradores.decoradorLoginTexFormField(
                labelText: 'Your Email', hintText: 'example@gmail.com'),
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = new RegExp(pattern);
              return regExp.hasMatch(value ?? '') ? null : 'Email invalido';
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (value) => formService.password = value,
            autocorrect: false,
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: Decoradores.decoradorLoginTexFormField(
                labelText: 'Password', hintText: '***********'),
            validator: (value) {
              return value != null && value.length >= 6
                  ? null
                  : 'debe ingreser 6 o mas caracteres';
            },
          ),
          const SizedBox(height: 30),
          MaterialButton(
            disabledColor: Colors.grey,
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 13),
            color: const Color.fromRGBO(51, 49, 47, 0.8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            onPressed: formService.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    if (!formService.isValid()) return;
                    formService.isLoading = true;
                    await Future.delayed(const Duration(seconds: 2));
                    Navigator.pushReplacementNamed(context, 'home');
                  },
            child: Text(
              formService.isLoading ? 'espere ' : 'log in',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

// #EBDAD1
// rgb(235, 218, 209)
