import 'package:get/get.dart';
import 'package:testelogin/Model/user.dart';
import 'package:testelogin/Service/auth.dart';
import 'package:testelogin/Service/authnotifier.dart';
import 'package:testelogin/utils/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Users _users = new Users();
  Authentication _authentication = new Authentication();

  bool showPassword = true;
  bool showConfirmPassword = true;
  final TextEditingController _passwordController = new TextEditingController();
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

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    RegExp regExp = new RegExp(
        r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$');
    AuthNotifier authNotifier =
    Provider.of<AuthNotifier>(context, listen: false);
    if (_users.displayName.length < 3) {
      toast("Nome precisa ter no mínimo 3 caracteres".tr);
    } else if (!regExp.hasMatch(_users.email)) {
      toast("Insira um Email válido".tr);
    } else if (_users.phone.length != 9) {
      toast("Número de Contato precisa ter 9 números.".tr);
    } else if (int.tryParse(_users.phone) == null) {
      toast("Número de Contato precisa ser um número".tr);
    } else if (_users.password.length < 8) {
      toast("A senha precisa ter no mínimo 8 caracteres".tr);
    } else if (_passwordController.text.toString() != _users.password) {
      toast("A senha de confirmação não é igual à sua senha".tr);
    } else {
      print("Feito!");
      _users.role = "user";
      _authentication.signup(_users, authNotifier, context);
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
              Color.fromRGBO(2, 2, 2, 0.7647058823529411),
              Color.fromRGBO(2, 2, 2, 1),
              Color.fromRGBO(355, 63, 111, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child:Form(
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
                  top: 190,
                  child: Container(
                    padding: EdgeInsets.all(32),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(62),
                          topRight: Radius.circular(62),
                        )
                    ),
                    child: Column(
                      children: <Widget>[
                        _buildSignUpForm(),

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
  Widget _buildSignUpForm() {
    return Column(
      children: [
        Text(
          "Registar".tr,
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        // User Name Field
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
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
            onSaved: (newValue) {
              _users.displayName = newValue;
            },
            keyboardType: TextInputType.name,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Nome de Utilizador'.tr,
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 255, 255, 0.8352941176470589),
              ),
              icon: Icon(
                Icons.account_circle,
                color: Color.fromRGBO(255, 255, 255, 0.8352941176470589),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // Email Field
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
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
            onSaved: (newValue) {
              _users.email = newValue;
            },
            keyboardType: TextInputType.emailAddress,
            cursorColor: Color.fromRGBO(255, 255, 255, 0.8352941176470589),
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 255, 255, 0.8352941176470589),
              ),
              icon: Icon(
                Icons.email,
                color: Color.fromRGBO(255, 255, 255, 0.8352941176470589),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // Phone Field
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
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
            onSaved: (newValue) {
              _users.phone = newValue;
            },
            keyboardType: TextInputType.phone,
            cursorColor: Color.fromRGBO(255, 255, 255, 0.8352941176470589),
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Número de Telemóvel'.tr,
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 255, 255, 0.8352941176470589),
              ),
              icon: Icon(
                Icons.phone,
                color: Color.fromRGBO(255, 255, 255, 0.8352941176470589),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        // password field
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
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
              _users.password = newvalue;
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
              hintText: 'Senha'.tr,
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
        // confirm password field
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
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
            obscureText: showConfirmPassword,
            validator: (value) {
              return null;
            },
            controller: _passwordController,
            // controller
            cursorColor: Color.fromRGBO(255, 255, 255, 0.8352941176470589),
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: Icon(
                    (showConfirmPassword)
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Color.fromRGBO(255, 255, 255, 0.8352941176470589),
                  ),
                  onPressed: () {
                    setState(() {
                      showConfirmPassword = !showConfirmPassword;
                    });
                  }),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Confirme a senha'.tr,
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

        // sign up button
        SizedBox(
          height: 50,
        ),
        GestureDetector(
          onTap: () {
            // submit function
            _submitForm();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
              "Registar".tr,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        // Login Line
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Já Possui uma conta?'.tr,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}