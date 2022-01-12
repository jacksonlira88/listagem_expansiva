import 'package:flutter/material.dart';
import 'package:primeiro_app/model/contato.dart';
import 'package:primeiro_app/pages/lista_contatos.dart';

class ContatoTile extends StatelessWidget {
  final Contato contato;

  const ContatoTile({Key? key, required this.contato}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: ContatoHelper.getIconByContatoType(contato.tipo),
        backgroundColor: Colors.blue[200],
      ),
      title: Text(contato.nome),
      subtitle: Text(contato.telefone),
    );
  }
}
