

import 'dart:developer';

import 'package:app_expl/checkbox.dart';
import 'package:app_expl/login.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String radioItemValue = 'male';

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  int id = 1;
  String? name, place, email, phone, username, password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registration",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Name"),
                      hintText: 'Enter Your  Name'),
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your Name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Place'),
                      hintText: 'Enter Your Place'),
                  onChanged: (value) {
                    place = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your Place';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Email"),
                      hintText: 'Enter Your Email Address'),
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your Email';
                    }else  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Phone'),
                      hintText: 'Enter Your Phone number'),
                  onChanged: (value) {
                    phone = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your Phone';
                    } else if (value.length >10 || value.length <10){
                      return 'Please Enter Valid Phone Number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Gender'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: id,
                      onChanged: (value) {
                        setState(() {
                          radioItemValue = 'male';
                          id = 1;
                        });
                      },
                    ),
                    Text('Male'),
                    SizedBox(
                      width: 10,
                    ),
                    Radio(
                      value: 2,
                      groupValue: id,
                      onChanged: (value) {
                        setState(() {
                          radioItemValue = 'female';
                          id = 2;
                        });
                      },
                    ),
                    Text('Female')
                  ],
                ),
                TextFormField(
                  controller: usernamecontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Username'),
                      hintText: 'Enter Your Username'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your Username';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Password'),
                      hintText: 'Enter Your Password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your Password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            log("name =" + name.toString());
                            log("place =" + place.toString());
                            log("email =" + email.toString());
                            log("phone =" + phone.toString());
                            log("gender =" + radioItemValue.toString());
                            log("username =" + usernamecontroller.text);
                            log("password =" + passwordcontroller.text);
                          }
                        },
                        child: Text("Registration")),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account?"),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ))
                  ],
                ),
                Center(
                  child: TextButton(
                    
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return CheckboxWidget();
                    },));
                  }, child: Text("Checkbox")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
