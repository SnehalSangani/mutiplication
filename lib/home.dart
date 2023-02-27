import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

TextEditingController txtname = TextEditingController();

var key = GlobalKey<FormState>();
int number = 1;
List<int> table = [];



class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Table ", ),

        ),
        body: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: txtname,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      hintText: "Enter the number",

                        ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        number = int.parse(txtname.text);
                        key.currentState!.validate();
                        for (int i = 1; i <= 10; i++) {
                          table.add(i);
                        }
                        print(number);
                        key.currentState!.deactivate();
                      });

                    },
                    child: Text("Generate"),),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25,left: 190),
                  child: Center(
                    child: ListView.builder(
                      itemBuilder: (context, index) => Text(
                          "${number} * ${index + 1} = ${number * (index + 1)}",style: TextStyle(fontSize: 25)),
                      itemCount: table.length,
                      shrinkWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}