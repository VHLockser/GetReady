import 'package:flutter/cupertino.dart';
import 'package:testelogin/admin/api/firebase_api.dart';
import 'package:testelogin/admin/model/todo.dart';

import '../../Model/user.dart';


class TodosProvider extends ChangeNotifier {


  List<Todo> _todos = [];

  List<Todo> get BicepsCostas => _todos.where((todo)=> todo.Treino == 'Biceps e Costas' && todo.Nivel == 'Iniciante' && (todo.isDone == true || todo.isDone == false))
      .toList();
  List<Todo> get BicepsCostasMedio => _todos.where((todo)=> todo.Treino == 'Biceps e Costas' && todo.Nivel == 'Intermediário' && (todo.isDone == true || todo.isDone == false) )
      .toList();
  List<Todo> get BicepsCostasAvancado => _todos.where((todo)=> todo.Treino == 'Biceps e Costas' && todo.Nivel == 'Avançado' && (todo.isDone == true || todo.isDone == false))
      .toList();

  List<Todo> get TricepsPeito => _todos.where((todo)=> todo.Treino == 'Triceps e Peito' && todo.Nivel == 'Iniciante')
      .toList();
  List<Todo> get TricepsPeitoMedio => _todos.where((todo)=> todo.Treino == 'Triceps e Peito' && todo.Nivel == 'Intermediário' && (todo.isDone == true || todo.isDone == false))
      .toList();
  List<Todo> get TricepsPeitoAvancado => _todos.where((todo)=> todo.Treino == 'Triceps e Peito' && todo.Nivel == 'Avançado' && (todo.isDone == true || todo.isDone == false))
      .toList();

  List<Todo> get PernasOmbros => _todos.where((todo)=> todo.Treino == 'Pernas e Ombros' && todo.Nivel == 'Iniciante')
      .toList();
  List<Todo> get PernasOmbrosMedio => _todos.where((todo)=> todo.Treino == 'Pernas e Ombros' && todo.Nivel == 'Intermediário' && (todo.isDone == true || todo.isDone == false))
      .toList();
  List<Todo> get PernasOmbrosAvancado => _todos.where((todo)=> todo.Treino == 'Pernas e Ombros' && todo.Nivel == 'Avançado' && (todo.isDone == true || todo.isDone == false))
      .toList();

  List<Todo> get TreinoTriceps => _todos.where((todo)=> todo.Treino == 'Triceps')
      .toList();

  List<Todo> get TreinoPeito => _todos.where((todo)=> todo.Treino == 'Peito')
      .toList();

  List<Todo> get TreinoCostas => _todos.where((todo)=> todo.Treino == 'Costas')
      .toList();

  List<Todo> get TreinoBiceps => _todos.where((todo)=> todo.Treino == 'Biceps')
      .toList();




  List<Todo> get Peito => _todos.where((todo)=> todo.Musculo == 'Peito'&& todo.isDone == true)
      .toList();

  List<Todo> get PeitoIniciante => _todos.where((todo)=> todo.Musculo == 'Peito' && todo.Nivel == 'Iniciante')
      .toList();

  List<Todo> get PeitoMedio => _todos.where((todo)=> todo.Musculo == 'Peito' && todo.Nivel == 'Intermediário')
      .toList();

  List<Todo> get PeitoAvancado => _todos.where((todo)=> todo.Musculo == 'Peito' && todo.Nivel == 'Avançado')
      .toList();




  List<Todo> get Biceps => _todos.where((todo)=> todo.Musculo == 'Biceps'&& todo.isDone == true)
      .toList();

  List<Todo> get BicepsIniciante => _todos.where((todo)=> todo.Musculo == 'Biceps' && todo.Nivel == 'Iniciante')
      .toList();

  List<Todo> get BicepsMedio => _todos.where((todo)=> todo.Musculo == 'Biceps' && todo.Nivel == 'Intermediário')
      .toList();

  List<Todo> get BicepsAvancado => _todos.where((todo)=> todo.Musculo == 'Biceps' && todo.Nivel == 'Avançado')
      .toList();



  List<Todo> get Triceps => _todos.where((todo)=> todo.Musculo == 'Triceps' && todo.Treino =="Triceps e Peito" && todo.isDone == true)
      .toList();

  List<Todo> get TricepsIniciante => _todos.where((todo)=> todo.Musculo == 'Triceps' && todo.Treino =="Triceps e Peito" && todo.isDone == true)
      .toList();

  List<Todo> get TricepsMedio => _todos.where((todo)=> todo.Musculo == 'Triceps' && todo.Nivel == 'Intermediário')
      .toList();

  List<Todo> get TricepsAvancado => _todos.where((todo)=> todo.Musculo == 'Triceps' && todo.Nivel == 'Avançado')
      .toList();



  List<Todo> get Costas => _todos.where((todo)=> todo.Musculo == 'Costas' && todo.isDone == true)
      .toList();

  List<Todo> get CostasIniciante => _todos.where((todo)=> todo.Musculo == 'Costas' && todo.Nivel == 'Iniciante')
      .toList();

  List<Todo> get CostasMedio => _todos.where((todo)=> todo.Musculo == 'Costas' && todo.Nivel == 'Intermediário')
      .toList();

  List<Todo> get CostasAvancado => _todos.where((todo)=> todo.Musculo == 'Costas' && todo.Nivel == 'Avançado')
      .toList();



  List<Todo> get Pernas => _todos.where((todo)=> todo.Musculo == 'Pernas' && todo.isDone == true)
      .toList();

  List<Todo> get PernasIniciante => _todos.where((todo)=> todo.Musculo == 'Pernas' && todo.Nivel == 'Iniciante')
      .toList();

  List<Todo> get PernasMedio => _todos.where((todo)=> todo.Musculo == 'Pernas' && todo.Nivel == 'Intermediário')
      .toList();

  List<Todo> get PernasAvancado => _todos.where((todo)=> todo.Musculo == 'Pernas' && todo.Nivel == 'Avançado')
      .toList();



  List<Todo> get Ombros => _todos.where((todo)=> todo.Musculo == 'Ombros' && todo.isDone == true)
      .toList();

  List<Todo> get OmbrosIniciante => _todos.where((todo)=> todo.Musculo == 'Ombros' && todo.Nivel == 'Iniciante')
      .toList();

  List<Todo> get OmbrosMedio => _todos.where((todo)=> todo.Musculo == 'Ombros' && todo.Nivel == 'Intermediário')
      .toList();

  List<Todo> get OmbrosAvancado => _todos.where((todo)=> todo.Musculo == 'Ombros' && todo.Nivel == 'Avançado')
      .toList();


  List<Todo> get Abs => _todos.where((todo)=> todo.Musculo == 'Abdominal'&& todo.isDone == true)
      .toList();

  List<Todo> get AbsIniciante => _todos.where((todo)=> todo.Musculo == 'Abdominal' && todo.Nivel == 'Iniciante')
      .toList();

  List<Todo> get AbsMedio => _todos.where((todo)=> todo.Musculo == 'Abdominal' && todo.Nivel == 'Intermediário')
      .toList();

  List<Todo> get AbsAvancado => _todos.where((todo)=> todo.Musculo == 'Abdominal' && todo.Nivel == 'Avançado')
      .toList();




  List<Todo> get todos => _todos.where((todo)=> todo.Nivel.isNotEmpty ).toList();

  List<Todo> get Iniciante => _todos.where((todo)=> todo.Nivel == 'Iniciante').toList();

  List<Todo> get Medio => _todos.where((todo)=> todo.Nivel == 'Médio').toList();

  List<Todo> get Avancado => _todos.where((todo)=> todo.Nivel == 'Avançado').toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void setTodos(List<Todo> todos) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _todos = todos;
        notifyListeners();
      });

  void addTodo(Todo todo) => FirebaseApi.createTodo(todo);

  void removeTodo(Todo todo) => FirebaseApi.deleteTodo(todo);

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    FirebaseApi.updateTodo(todo);

    return todo.isDone;
  }

  void updateTodo(Todo todo, String Nome, String Informacao, String Musculo, String Nivel, String Imagem) {
    todo.Nome = Nome;
    todo.Informacao = Informacao;
    todo.Musculo = Musculo;
    todo.Nivel = Nivel;
    todo.imagem = Imagem;

    FirebaseApi.updateTodo(todo);
  }

  void updateUser(Users users, String displayName, String email, String password, String phone) {
    users.displayName = displayName;
    users.email = email;
    users.password = password;
    users.phone = phone;

    FirebaseApi.updateUser(users);
  }
}
