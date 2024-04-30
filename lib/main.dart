import 'package:bmi/calculate.dart';
import 'package:flutter/material.dart';

void main() {
  (runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  )
      // const MyApp()
      ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController heightcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  TextEditingController resultcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI CALCULATER",
      home: Scaffold(
          appBar: AppBar(
              title: const Text(
                "BMI CALCULATER",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              backgroundColor: Colors.blue),
          body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 12, left: 12, top: 40),
                      child: TextFormField(
                        controller: namecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name is Required";
                          }
                        },
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            labelText: "Enter Your Name:"),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 12, left: 12, top: 40),
                      child: TextFormField(
                        controller: agecontroller,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ("Please Enter your age");
                          }
                        },
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            labelText: "Enter Your Age:"),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 12, left: 12, top: 40),
                      child: TextFormField(
                        controller: heightcontroller,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ("Please Enter Your Height");
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Enter Your Height in inch",
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            labelText: "Enter Your height:"),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10, left: 10, top: 40),
                      child: TextFormField(
                        controller: weightcontroller,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ("Please Enter Your Weight");
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Enter Your Weight in KG",
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            labelText: "Enter Your weight:"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate())
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => calc(
                                  name: namecontroller.text,
                                  age: int.parse(agecontroller.text),
                                  height: double.parse(heightcontroller.text),
                                  weight: int.parse(
                                    weightcontroller.text,
                                  )),
                            ),
                          );
                      },
                      child: const Text(
                        "CAlCULATE",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
          )),
    );
  }
}
