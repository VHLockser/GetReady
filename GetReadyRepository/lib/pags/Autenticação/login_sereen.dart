import 'package:flutter_svg/svg.dart';
import 'package:testelogin/Model/user.dart';
import 'package:testelogin/Service/auth.dart';
import 'package:testelogin/Service/authnotifier.dart';
import 'package:testelogin/pags/Autentica%C3%A7%C3%A3o/signup_screen.dart';
import 'package:testelogin/utils/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:testelogin/Service/auth.dart';

import '../../Service/Auth_Service.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Users _users = new Users();
  Authentication _authentication = new Authentication();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool showPassword = true;

  AuthClass authClass = AuthClass();

  // initstate
  @override
  void initState() {
    AuthNotifier authNotifier =
    Provider.of<AuthNotifier>(context, listen: false);
    // initialize current user
    _authentication.initializeCurrentUser(authNotifier);
    super.initState();
  }

  void toast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey,
      gravity: ToastGravity.BOTTOM,
    );
  }

  // submit form
  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    AuthNotifier authNotifier =
    Provider.of<AuthNotifier>(context, listen: false);
    RegExp regExp = new RegExp(
        r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$');

    if (!regExp.hasMatch(_users.email)) {
      // toast
      toast("Enter a valid Email ID");
    } else if (_users.password.length < 8) {
      toast('Password must have atleast 8 characters');
    } else {
      // login function
      _authentication.login(_users, authNotifier, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 0, 0, 0.8941176470588236),
              Color.fromRGBO(2, 2, 2, 0.9254901960784314),
              Color.fromRGBO(355, 63, 111, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 850,
                ),
                Image.asset(
                  "assets/images/loginimg.jpg",
                  width: double.maxFinite,
                  height: 288,
                ),

                Positioned(
                  top: 200,
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(62),
                          topRight: Radius.circular(62),
                        )
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topCenter,
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/logo1.png"),
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(70.0),
                              bottomRight: Radius.circular(70.0),
                              topLeft: Radius.circular(70.0),
                              topRight: Radius.circular(70.0),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Entrar",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //Linha de Username

                        //Linha de password

                        //botão de login
                        _buildLoginForm(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        SizedBox(height: 30),
        // email text field
        Container(
          margin: EdgeInsets.symmetric(horizontal: 0),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[
                  Color.fromRGBO(171, 17, 63, 1.0),
                  Color.fromRGBO(190, 23, 23, 1.0),
                ]
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.pinkAccent,
                spreadRadius: 1,
                blurRadius: 12,
              )
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            validator: (value) {
              return null;
            },
            onSaved: (newvalue) {
              return _users.email = newvalue;
            },
            cursorColor: Colors.white,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Email',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 255, 255, 0.8352941176470589),
              ),
              // prefix icon
              //icon: Icon(Icons.email),
              icon: Icon(
                Icons.email,
                color: Color.fromRGBO(255, 255, 255, 0.8352941176470589),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 0),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[
                  Color.fromRGBO(171, 17, 63, 1.0),
                  Color.fromRGBO(190, 23, 23, 1.0),
                ]
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.pinkAccent,
                spreadRadius: 1,
                blurRadius: 12,
              )
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            obscureText: showPassword,
            validator: (value) {
              return null;
            },
            onSaved: (newvalue) {
              return _users.password = newvalue;
            },
            cursorColor: Color.fromRGBO(255, 255, 255, 0.8352941176470589),
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: Icon(
                    (showPassword) ? Icons.visibility_off : Icons.visibility,
                    color: Color.fromRGBO(255, 255, 255, 0.8352941176470589),
                  ),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  }),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Password',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 255, 255, 0.8352941176470589),
              ),
              // prefix icon
              //icon: Icon(Icons.email),
              icon: Icon(
                Icons.lock,
                color: Color.fromRGBO(255, 255, 255, 0.8352941176470589),
              ),
            ),
          ),
        ),


        SizedBox(
          height: 50,
        ),
        GestureDetector(
          onTap: () {
            // submit function
            _submitForm();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors:[
                    Colors.red,
                    Color.fromRGBO(241, 6, 76, 1.0),
                  ]
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.pinkAccent,
                  spreadRadius: 1,
                  blurRadius: 12,
                )
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),

        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Não Possui uma Conta?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignUpScreen()));
              },
              child: Text(
                'Registe-se Aqui.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }



  Widget buttonItem(
      String imagepath, String buttonName, double size, VoidCallback onTap) {// Good
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 60,
        height: 60,
        child: Card(
          color: Colors.black,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imagepath,
                height: size,
                width: size,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textItem(
      String labeltext, TextEditingController controller, bool obscureText) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1.5,
              color: Colors.amber,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}