import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:testelogin/admin/listagemdoadmin.dart';
import 'package:testelogin/admin/provider/todos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testelogin/pags/Autentica%C3%A7%C3%A3o/login_sereen.dart';
import 'package:testelogin/pags/navegador.dart';
import 'package:testelogin/pags/splashart.dart';
import 'Service/auth.dart';
import 'Service/authnotifier.dart';
import 'codsupl/LocaleString.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AuthNotifier()),
      ChangeNotifierProvider(create: (_) => TodosProvider()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocaleString(),
      locale: Locale('pt','BR'),
      debugShowCheckedModeBanner: false,
      title: 'GetReady',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'Corben',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Authentication _authentication = new Authentication();
  @override
  void initState() {
    AuthNotifier authNotifier =
    Provider.of<AuthNotifier>(context, listen: false);
    // initialize current user
    _authentication.initializeCurrentUser(authNotifier);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(0, 0, 0, 0.8941176470588236),
            Color.fromRGBO(73, 0, 0, 0.9254901960784314),
            Color.fromRGBO(171, 1, 1, 1.0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/logopng2.png",
              width: double.maxFinite,
              height: 250,
            ),
            Text(
              'GetReady',
              style: TextStyle(
                fontSize: 60,
                fontFamily: 'Corben',
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),

            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                // check user null
                (authNotifier.user == null)
                    ? Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => LoginScreen()))
                    : (authNotifier.userDetails == null)
                    ? print('Espere')
                    : (authNotifier.userDetails.role == 'admin')
                    ? Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AdminListag()))
                    : Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Home()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Abrir".tr,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    color: Color.fromRGBO(255, 63, 111, 1),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}