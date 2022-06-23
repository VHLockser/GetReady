import 'package:flutter/cupertino.dart';
import 'package:testelogin/admin/utils.dart';

class TodoField {
  static const createdTime = 'createdTime';
}


class Todo {
  String Nome;
  String id;
  String Informacao;
  String Musculo;
  String Nivel;
  String imagem;
  String Treino;
  String Rep;
  bool isDone;

  Todo({
    @required this.Nome,
    this.Informacao = '',
    this.Musculo = '',
    this.Nivel = '',
    this.imagem = '',
    this.Treino = '',
    @required this.id,
    this.isDone = false,
    this.Rep,
  });

  static Todo fromJson(Map<String, dynamic> json) => Todo(
    Nome: json['Nome'],
    Informacao: json['Informacao'],
    Musculo: json['Musculo'],
    Nivel: json['Nivel'],
    imagem: json['imagem'],
    Treino: json['Treino'],
    id: json['id'],
    isDone: json['isDone'],
    Rep: json['Rep'],
  );

  Map<String, dynamic> toJson() => {
    'Nome': Nome,
    'Informacao': Informacao,
    'Musculo': Musculo,
    'Nivel': Nivel,
    'imagem': imagem,
    'Treino': Treino,
    'id': id,
    'isDone': isDone,
    'Rep': Rep,
  };
}
