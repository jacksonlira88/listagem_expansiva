import 'package:flutter/material.dart';
import 'package:primeiro_app/repository/contatos_provider.dart';
import 'package:provider/provider.dart';
import 'package:primeiro_app/pages/cadastrar_contato.dart';
import 'package:primeiro_app/pages/lista_contatos.dart';
import 'package:primeiro_app/widgets/drawer_home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Contatos()),
      ],
      child: const MyApp(),
    ),
  );
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
    //Contatos _contatos = Provider.of(context);
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
      drawer: const DrawerHome(),
      body: const ListaContatosPage(),
    );
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
