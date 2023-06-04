import 'package:flutter/material.dart';

class FondoLogin extends StatelessWidget {
  final Widget child;
  const FondoLogin({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(243, 223, 212, 1),
      child: Stack(
        children: [
          _BoxSignUp(),
          SizedBox(height: 60),
          child,
        ],
      ),
    );
  }
}
// rgb(235, 218, 209)

class _BoxSignUp extends StatelessWidget {
  const _BoxSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, top: 20),
      alignment: Alignment.topRight,
      child: Text(
        'Sign up',
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}
