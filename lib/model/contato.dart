// Define o contato e seus atributos.
class Contato {
  final String nome;
  final String telefone;
  final ContatoType tipo;
  bool isExpanded = false;

  Contato({required this.nome, required this.telefone, required this.tipo});
}

// Enumera os tipos de contatos
enum ContatoType { CELULAR, TRABALHO, FAVORITO, CASA }
