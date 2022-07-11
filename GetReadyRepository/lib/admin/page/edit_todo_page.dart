import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:testelogin/admin/model/todo.dart';
import 'package:testelogin/admin/provider/todos.dart';
import 'package:testelogin/admin/widget/todo_form_widget.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key key, @required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();

   String Nome;
   String Informacao;
   String Musculo;
   String Nivel;
   String Treino;
   String imagem;

  @override
  void initState() {
    super.initState();

    Nome = widget.todo.Nome;
    Informacao = widget.todo.Informacao;
    Musculo = widget.todo.Musculo;
    Nivel = widget.todo.Nivel;
    imagem = widget.todo.imagem;
    Treino = widget.todo.Treino;

  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Editar Exercício'.tr),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                provider.removeTodo(widget.todo);

                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: TodoFormWidget(
              Nome: Nome,
              Informacao: Informacao,
              Musculo: Musculo,
              Nivel: Nivel,
              imagem: imagem,
              onChangedNome: (Nome) => setState(() => this.Nome = Nome),
              onChangedInformacao: (Informacao) => setState(() => this.Informacao = Informacao),
              onChangedMusculo: (Musculo) => setState(() => this.Musculo = Musculo),
              onChangedNivel: (Nivel) => setState(() => this.Nivel = Nivel),
              onChangedTreino: (Treino) => setState(() => this.Treino = Treino),
              onChangedImagem: (Imagem) => setState(() => this.imagem = Imagem),
              onSavedTodo: saveTodo,
            ),
          ),
        ),
      );

  void saveTodo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);

      provider.updateTodo(widget.todo, Nome, Informacao, Musculo, Nivel, imagem);

      Navigator.of(context).pop();
    }
  }
}
