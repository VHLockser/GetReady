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
  var Tempo;
  bool isDone;

  Todo({
    @required this.Nome,
    this.Informacao = '',
    this.Musculo = '',
    this.Nivel = '',
    this.imagem = '',
    this.Treino = '',
    this.Tempo = '',
    @required this.id,
    this.isDone = false,
    this.Rep = '',
  });

  static Todo fromJson(Map<String, dynamic> json) => Todo(
    Nome: json['Nome'],
    Informacao: json['Informacao'],
    Musculo: json['Musculo'],
    Nivel: json['Nivel'],
    imagem: json['imagem'],
    Treino: json['Treino'],
    Tempo: json['Tempo'],
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
    'Tempo': Tempo,
  };
}
