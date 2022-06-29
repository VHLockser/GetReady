import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:testelogin/admin/model/todo.dart';
import 'package:testelogin/admin/provider/todos.dart';
import 'package:testelogin/admin/widget/todo_form_widget.dart';

class AddTodoDialogWidget extends StatefulWidget {
  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String Nome = '';
  String Informacao = '';
  String Musculo = '';
  String Nivel = '';
  String imagem = '';
  String Treino = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adicionar Exercício'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 20),
                TodoFormWidget(
                  onChangedNome: (Nome) => setState(() => this.Nome = Nome),
                  onChangedInformacao: (Informacao) => setState(() => this.Informacao = Informacao),
                  onChangedMusculo: (Musculo) => setState(() => this.Musculo = Musculo),
                  onChangedNivel: (Nivel) => setState(() => this.Nivel = Nivel),
                  onChangedTreino: (Treino) => setState(() => this.Treino = Treino),
                  onChangedImagem: (Imagem) => setState(() => this.imagem = Imagem),
                  onSavedTodo: addTodo,
                ),
              ],
            ),
          ),

        ),
      );

  void addTodo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        id: DateTime.now().toString(),
        Nome: Nome,
        Informacao: Informacao,
        Musculo: Musculo,
        Nivel: Nivel,
        imagem: imagem,
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
