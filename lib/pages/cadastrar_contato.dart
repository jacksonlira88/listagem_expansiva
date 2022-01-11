import 'package:flutter/material.dart';

class CadastrarContato extends StatelessWidget {
  const CadastrarContato({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Adicionar contato';

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: const FormCadastrarContato(),
    );
  }
}

// Create a Form widget.
class FormCadastrarContato extends StatefulWidget {
  const FormCadastrarContato({Key? key}) : super(key: key);

  @override
  FormCadastrarContatoState createState() {
    return FormCadastrarContatoState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class FormCadastrarContatoState extends State<FormCadastrarContato> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    //custumiza o compo de entrada de nome do contato
    InputDecoration _decoraEntradaNome() {
      return const InputDecoration(
          filled: true,
          icon: Icon(Icons.person),
          hintText: 'Nome',
          labelText: 'Nome do contato');
    }

    // Decora o campo de entrada do telefone
    InputDecoration _decoraEntradaTelefone() {
      return const InputDecoration(
          filled: true,
          icon: Icon(Icons.phone_android),
          hintText: 'Telefone',
          labelText: 'telefone do contato');
    }

    const sizedBoxSpace = SizedBox(height: 24);
    return Form(
      key: _formKey,
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxSpace,
              TextFormField(
                decoration: _decoraEntradaNome(),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome do contato obrigatório';
                  }
                  return null;
                },
              ),
              //Campo ainda sem validação
              sizedBoxSpace,
              TextFormField(
                decoration: _decoraEntradaTelefone(),
              ),
              sizedBoxSpace,
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processando dados')),
                        //TODO Adicionar contato a lista

                        //TODO Voltar a tela inicial, atualizar estado.
                      );
                    }
                  },
                  child: const Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
