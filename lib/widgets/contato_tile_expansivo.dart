import 'package:flutter/material.dart';
import 'package:primeiro_app/model/contato.dart';

class ContatoTileEspansivo extends StatelessWidget {
  final Contato contato;

  const ContatoTileEspansivo({Key? key, required this.contato})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(contato.nome),
        subtitle: const Text('Para deletar o item, click na lixeira'),
        trailing: const Icon(Icons.delete),
        onTap: () {
          //TODO remover item da lista e atualizar a tela?
        });
  }
}

/*
ListTile(
                title: Text(contato.nome),
                subtitle: const Text('Para deletar o item, click na lixeira'),
                trailing: const Icon(Icons.delete),
                onTap: () {
                  setState(() {
                    contatos.removeWhere(
                        (Contato currentItem) => contato == currentItem);
                  });
                }),

*/