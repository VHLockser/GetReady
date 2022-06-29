import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testelogin/admin/page/home_page.dart';
import 'package:testelogin/admin/provider/todos.dart';
import 'package:provider/provider.dart';

import '../common/theme.dart';

Future AdminLista() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

}

class AdminListag extends StatelessWidget {
  static final String title = 'Gestão de Exercícios'.tr;

  const AdminListag({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => TodosProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: appTheme,
      home: HomePage(),
    ),
  );
}
