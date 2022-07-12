import 'package:flutter/material.dart';

class CartaoFundo extends StatelessWidget {
  const CartaoFundo({Key? key, required this.cor, required this.filhoCartao})
      : super(key: key);

  final Color cor;
  final Widget filhoCartao;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: filhoCartao,
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
