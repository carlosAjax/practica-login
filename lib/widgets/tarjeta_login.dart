import 'package:flutter/material.dart';

class TarjetaLogin extends StatelessWidget {
  final Widget child;
  const TarjetaLogin({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: child,
    );
  }
}
