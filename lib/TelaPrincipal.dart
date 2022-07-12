import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cartaofundo.dart';
import 'conteudoicone.dart';
import 'constantes.dart';

enum Sexo {
  masculino,
  feminino,
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Sexo? sexoSelecionado;
  int altura = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      sexoSelecionado = Sexo.masculino;
                    });
                  },
                  child: CartaoFundo(
                    cor: sexoSelecionado == Sexo.masculino
                        ? kCorPadrao
                        : kCorInativa,
                    filhoCartao: const ConteudoSexo(
                      icone: FontAwesomeIcons.mars,
                      descricao: 'MASCULINO',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      sexoSelecionado = Sexo.feminino;
                    });
                  },
                  child: CartaoFundo(
                    cor: sexoSelecionado == Sexo.feminino
                        ? kCorPadrao
                        : kCorInativa,
                    filhoCartao: const ConteudoSexo(
                      icone: FontAwesomeIcons.venus,
                      descricao: 'FEMININO',
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: CartaoFundo(
              cor: kCorPadrao,
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('ALTURA', style: kDescricaoTextSyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    //deixar o cm alinhado ao numero
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        altura.toString(),
                        style: kEstiloNumero,
                      ),
                      const Text(
                        'cm',
                        style: kDescricaoTextSyle,
                      )
                    ],
                  ),
                  Slider(
                    activeColor: kCorBarraInferior,
                    inactiveColor: kCorInativa,
                    onChanged: (double novoValor) {
                      setState(() {
                        altura = novoValor.round();
                      });
                    },
                    value: altura.toDouble(),
                    min: 120.0,
                    max: 220.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: CartaoFundo(
                    cor: kCorPadrao,
                    filhoCartao: ConteudoSexo(
                      icone: FontAwesomeIcons.mars,
                      descricao: 'MASCULINO',
                    ),
                  ),
                ),
                Expanded(
                  child: CartaoFundo(
                      cor: kCorPadrao,
                      filhoCartao: ConteudoSexo(
                        icone: FontAwesomeIcons.mars,
                        descricao: 'MASCULINO',
                      )),
                ),
              ],
            ),
          ),
          Container(
            color: kCorBarraInferior,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kAlturaBarraInferior,
          )
        ],
      ),
    );
  }
}
