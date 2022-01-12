import 'package:flutter/material.dart';
import 'package:primeiro_app/model/contato.dart';

class Contatos with ChangeNotifier {
  Map<String, Contato> _contatos = [] as Map<String, Contato>;

  final List<Contato> contatos = [];

  //pega a lista preenchida inicialmente ou vinda de um servidor
  List<Contato> getDadosInicias() {
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

    return [...contatos];
  }

//adicioanr contato a lista
  setContato(Contato contato) {
    contatos.add(contato);
  }

  int get count {
    return contatos.length;
  }

  Contato byIndex(int i) {
    return contatos[i];
  }
}
