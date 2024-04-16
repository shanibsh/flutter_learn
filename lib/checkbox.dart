import 'dart:developer';

import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({super.key});

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  Map<String, bool> values = {
    'Apple': false,
    'Banana': false,
    'cherry': false,
    'mango': false,
    'orange': false,
  };

  var tmpList = [];

  getCheckboxitems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpList.add(key);
      }
    });
    log(tmpList.toString());
    tmpList.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox Example"),
        backgroundColor: Colors.purple,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("Get Selected Check box Items"),
              onPressed: () {
                getCheckboxitems();
              },
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(child: ListView(
              children: values.keys.map((String key) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      key,
                      style: TextStyle(fontSize: 17.0),
                    ),
                    Checkbox(
                      activeColor: Colors.pink,
                      value: values[key],
                      onChanged: (bool? value) {
                        setState(() {
                          values[key] = value!;
                        });
                      },
                    )
                  ],
                );
              }).toList(),
            ))
          ],
        ),
      ),
    );
  }
}
