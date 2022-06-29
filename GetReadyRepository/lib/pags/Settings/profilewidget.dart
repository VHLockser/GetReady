

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../admin/utils.dart';

class ProfileWidget extends StatelessWidget {
  final String Nome;
  final String Email;
  final String password;
  final String phone;
  final ValueChanged<String> onChangedNome;
  final ValueChanged<String> onChangedEmail;
  final ValueChanged<String> onChangedpassword;
  final ValueChanged<String> onChangedphone;
  final VoidCallback onSavedTodo;
  final TextEditingController emailController;


  ProfileWidget({
    Key key,
    this.Nome = '',
    this.Email = '',
    this.password = '',
    this.phone = '',
    @required this.onChangedNome,
    @required this.onChangedEmail,
    @required this.onChangedpassword,
    @required this.onChangedphone,
    @required this.onSavedTodo,
    this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 50),
        buildTitle(),
        SizedBox(height: 8),
        buildDescription(),
        SizedBox(height: 8),
        buildNivel(),
        SizedBox(height: 40),
        buildReset(),
        SizedBox(height: 40),
        buildButton(),


      ],
    ),
  );

  Widget buildReset() => ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      minimumSize: Size.fromHeight(50),
    ),
    icon: Icon(Icons.email_outlined),
    label: Text(
      'Trocar Senha',
      style: TextStyle(fontSize: 24),
    ),
    onPressed: resetPassword,
  );

  Widget buildTitle() => TextFormField(
    controller: emailController,
    maxLines: 1,
    initialValue: Nome,
    onChanged: onChangedNome,
    validator: (title) {
      if (title.isEmpty) {
        return 'Não pode estar vazio!';
      }
      return null;
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Nome do Utilizador',
    ),
  );

  Widget buildDescription() => TextFormField(
    maxLines: 1,
    initialValue: Email,
    onChanged: onChangedEmail,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Email',
    ),
  );

  Widget buildMusculo() => TextFormField(
    maxLines: 1,
    initialValue: password,
    onChanged: onChangedpassword,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Senha',
    ),
  );

  Widget buildNivel() => TextFormField(
    maxLines: 1,
    initialValue: phone,
    onChanged: onChangedphone,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Número de Telemóvel',
    ),
  );

  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
      ),
      onPressed: onSavedTodo,
      child: Text('Salvar'),
    ),
  );


  Future resetPassword() async {
    try{
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
    } on FirebaseAuthException catch (e){
      print(e);

    }

  }
}
