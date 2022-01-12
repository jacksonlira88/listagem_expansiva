import 'package:flutter/material.dart';
import 'package:primeiro_app/model/contato.dart';
import 'package:primeiro_app/repository/contatos_provider.dart';
import 'package:primeiro_app/widgets/contato_tile.dart';
import 'package:primeiro_app/widgets/contato_tile_expansivo.dart';
import 'package:provider/provider.dart';

class ListaContatosPage extends StatefulWidget {
  const ListaContatosPage({Key? key}) : super(key: key);

  @override
  State<ListaContatosPage> createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatosPage> {
  List<Contato> ab = [];
  List<Contato> contatos = [];

  @override
  void initState() {
    super.initState();
    contatos.add(
        Contato(nome: 'joao', telefone: '3355-9995', tipo: ContatoType.CASA));
// preenche a lista de contatos inicialmente.
  }

  @override
  Widget build(BuildContext context) {
    //List<Contato> con = _contatos.getDadosInicias();
    ;
    ;
//print(con);

    return SingleChildScrollView(
      child: Container(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              // contatos.byIndex(index).isExpanded = !isExpanded;
            });
          },
          //TODO ERRO NA CHAMADA DO PROVIDER, RETORNANDO TIPOS DIFERENTES
          children: context
              .read<Contatos>()
              .getDadosInicias()
              .map<ExpansionPanel>((Contato contato) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ContatoTile(
                  contato: contato,
                );
              },
              body: ContatoTileEspansivo(contato: contato),
              isExpanded: contato.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }

//Painel que lista os contatos

}

// Retorna um Icon de acordo com o tipo de contato
class ContatoHelper {
  static Icon getIconByContatoType(ContatoType tipo) {
    switch (tipo) {
      case ContatoType.CELULAR:
        return Icon(Icons.phone_android, color: Colors.green[700]);
      case ContatoType.TRABALHO:
        return Icon(Icons.work, color: Colors.brown[600]);
      case ContatoType.FAVORITO:
        return Icon(Icons.star, color: Colors.yellow[600]);
      case ContatoType.CASA:
        return Icon(Icons.home, color: Colors.purple[600]);
    }
  }
}
