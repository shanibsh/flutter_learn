import 'package:app_expl/registration.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: usernamecontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('username'),
                      hintText: 'enter your username'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter username';
                    }
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Password'),
                    hintText: 'Enter Your Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter password';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("username = " + usernamecontroller.text);
                        print("password =" + passwordcontroller.text);
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Create Account ?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return RegistrationScreen();
                          },
                        ));
                      },
                      child: Text(
                        "SingUp",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
