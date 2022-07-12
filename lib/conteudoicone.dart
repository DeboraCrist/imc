import 'package:flutter/material.dart';
import 'constantes.dart';

class ConteudoSexo extends StatelessWidget {
  const ConteudoSexo({Key? key, required this.icone, required this.descricao})
      : super(key: key);

  final IconData icone;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icone,
          size: 95.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          descricao,
          style: kDescricaoTextSyle,
        )
      ],
    );
  }
}
