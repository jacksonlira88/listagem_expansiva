import 'package:flutter/material.dart';
import 'package:primeiro_app/model/contato.dart';
import 'package:primeiro_app/pages/cadastrar_contato.dart';

void main() {
  runApp(const MyApp());
}

const String _title = 'Meus contatos';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TelaInicial(),
      //remover o banner de debug
      debugShowCheckedModeBanner: false,
    );
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CadastrarContato()));
            },
            icon: const Icon(Icons.add),
            tooltip: 'Adicionar contato',
          )
        ],
      ),
      drawer: _drawer(),
      body: const MyHomePage(),
    );
  }
}

// cria uma gaveta (drawer) com três itens
Widget _drawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          title: const Text("Item 1"),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Item 2"),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Item 2"),
          onTap: () {},
        ),
      ],
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contato> contatos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

// preenche a lista de contatos inicialmente.
    contatos.add(
        Contato(nome: 'joao', telefone: '3355-9995', tipo: ContatoType.CASA));

    contatos.add(Contato(
        nome: 'Tereza', telefone: '3355-5566', tipo: ContatoType.TRABALHO));

    contatos.add(Contato(
        nome: 'Carlos', telefone: '3355-9987', tipo: ContatoType.CELULAR));

    contatos.add(Contato(
        nome: 'Abraao', telefone: '3355-26587', tipo: ContatoType.FAVORITO));

    contatos.add(Contato(
        nome: 'Tadeu', telefone: '3355-5666', tipo: ContatoType.CELULAR));

    contatos.add(Contato(
        nome: 'xand', telefone: '3355-8898', tipo: ContatoType.FAVORITO));

    contatos.add(Contato(
        nome: 'Tales', telefone: '3355-8995', tipo: ContatoType.TRABALHO));

    contatos.add(
        Contato(nome: 'Dao', telefone: '3355-8998', tipo: ContatoType.CASA));

    contatos.add(
        Contato(nome: 'Sintia', telefone: '3355-9884', tipo: ContatoType.CASA));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _painel(),
      ),
    );
  }

//Painel que lista os contatos
  Widget _painel() {
    return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            contatos[index].isExpanded = !isExpanded;
          });
        },
        children: contatos.map<ExpansionPanel>((Contato contato) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                leading: CircleAvatar(
                  child: ContatoHelper.getIconByContatoType(contato.tipo),
                  backgroundColor: Colors.blue[200],
                ),
                title: Text(contato.nome),
                subtitle: Text(contato.telefone),
              );
            },
            body: ListTile(
                title: Text(contato.nome),
                subtitle: const Text('Para deletar o item, click na lixeira'),
                trailing: const Icon(Icons.delete),
                onTap: () {
                  setState(() {
                    contatos.removeWhere(
                        (Contato currentItem) => contato == currentItem);
                  });
                }),
            isExpanded: contato.isExpanded,
          );
        }).toList());
  }
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

// Primeira lista funcional

/**
 * @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            var contato = contatos[index];
            return ListTile(
              leading: CircleAvatar(
                child: ContatoHelper.getIconByContatoType(contato.tipo),
                backgroundColor: Colors.blue[200],
              ),
              title: Text(contato.nome),
              subtitle: Text(contato.telefone),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_drop_down),
                onPressed: () => {},
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: contatos.length),
    );
  }
}
 * 
 * 
*/
