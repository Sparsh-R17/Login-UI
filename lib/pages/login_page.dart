import 'package:flutter/material.dart';
import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;

  final _form = GlobalKey<FormState>();

  movetoHome (BuildContext context) async{
    if(_form.currentState!.validate()){
      setState(() {
        changebutton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              Image.asset("assets/images/login_page.png",
              fit: BoxFit.fitHeight,
              ),
              const SizedBox(height: 20),
              Text("Welcome $name",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              )),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter UserName",
                        labelText: "UserName",
                      ),
                      validator: (input){
                        if(input!.isEmpty){
                          return "Username cannot be empty";
                        }

                        return null;
                      },
                      onChanged: (nameRecieved){
                        name = nameRecieved;
                        setState(() {}); //this calls the build
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password....",
                      ),
                        validator: (input) {
                          if (input!.isEmpty) {
                            return "Password cannot be empty";
                          }
                          else if (input.length < 6) {
                            return "Password should contain atleast 6 characters";
                          }
                          else if (input.length>18) {
                            return "Password exceeding characters (max 18 chars)";
                          }
                          return null;
                        }
                    ),
                    const SizedBox(height: 40),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(changebutton? 50 : 32),
                      color: Colors.deepPurple,
                      child: InkWell(
                        onTap: () => movetoHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: changebutton? 50 : 150,
                          height: 40,
                          alignment: Alignment.center,
                          child: changebutton? const Icon(
                            Icons.done,
                            color: Colors.white,
                          ) : const Text("Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
