import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String Nome;
  final String Informacao;
  final String Musculo;
  final String Nivel;
  final String imagem;
  final String Treino;
  final ValueChanged<String> onChangedNome;
  final ValueChanged<String> onChangedInformacao;
  final ValueChanged<String> onChangedMusculo;
  final ValueChanged<String> onChangedNivel;
  final ValueChanged<String> onChangedImagem;
  final ValueChanged<String> onChangedTreino;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({
    Key key,
    this.Nome = '',
    this.Informacao = '',
    this.Musculo = '',
    this.Nivel = '',
    this.imagem = '',
    this.Treino = '',
    @required this.onChangedNome,
    @required this.onChangedInformacao,
    @required this.onChangedMusculo,
    @required this.onChangedNivel,
    @required this.onChangedImagem,
    @required this.onChangedTreino,
    @required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            SizedBox(height: 8),
            buildDescription(),
            SizedBox(height: 8),
            buildMusculo(),
            SizedBox(height: 8),
            buildNivel(),
            SizedBox(height: 8),
            buildImagem(),
            SizedBox(height: 80),
            buildButton(),

          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: Nome,
        onChanged: onChangedNome,
        validator: (title) {
          if (title.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Nome do Exercício',
        ),
      );

  Widget buildDescription() => TextFormField(
        maxLines: 1,
        initialValue: Informacao,
        onChanged: onChangedInformacao,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Informação',
        ),
      );

  Widget buildMusculo() => TextFormField(
    maxLines: 1,
    initialValue: Musculo,
    onChanged: onChangedMusculo,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Musculo',
    ),
  );

  Widget buildNivel() => TextFormField(
    maxLines: 1,
    initialValue: Nivel,
    onChanged: onChangedNivel,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Nível',
    ),
  );

  Widget buildImagem() => TextFormField(
    maxLines: 1,
    initialValue: imagem,
    onChanged: onChangedImagem,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Caminho da Imagem',
    ),
  );

  Widget buildTreino() => TextFormField(
    maxLines: 1,
    initialValue: Treino,
    onChanged: onChangedTreino,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Treino',
    ),
  );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          onPressed: onSavedTodo,
          child: Text('Save'),
        ),
      );
}
