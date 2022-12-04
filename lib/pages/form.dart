// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  bool? _checkbox, _listTitleCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: 'Product Name',
                  prefixIcon: Icon(Icons.verified_outlined),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Product Name',
                  prefixIcon: Icon(Icons.verified_outlined),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10.0,
            ),
            Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.deepPurple,
                tristate: true,
                value: _checkbox,
                onChanged: (value) {
                  setState(() {
                    _checkbox = value;
                  });
                }),
            CheckboxListTile(
              value: _listTitleCheckBox,
              title: Text("Top Product"),
              onChanged: (val) {
                setState(
                  () {
                    _listTitleCheckBox = val;
                  },
                );
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            myBtn(context),
          ],
        ),
      ),
    );
  }

  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      // style: OutlineButton.styleForm(mininumSize: const Size(200, 50)),
      onPressed: () {},
      child: Text("Submit Form".toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
