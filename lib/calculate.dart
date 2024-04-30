import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class calc extends StatefulWidget {
  String name;
  int age;
  double height;
  int weight;

  calc({
    super.key,
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
  });

  @override
  State<calc> createState() => _calcState();
}

class _calcState extends State<calc> {
  late double result;
  late double meter;
  late String res;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    meter = widget.height * 0.3048;
    result = widget.weight / (meter * meter);
    res = result.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MYAPP",
      home: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "BMI CALCULATER",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              backgroundColor: Colors.blue),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Hi, " + widget.name,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(254, 56, 253, 1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  " BMI :" + res,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 5, 137, 239)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: result > 25
                      ? Image.asset("assets/images/overweight.png")
                      : result > 18
                          ? Image.asset("assets/images/fit.png")
                          : Image.asset("assets/images/under.jpeg"),
                ),
              ),
              Text(
                  result > 25
                      ? "You Are OverWeight"
                      : result > 18
                          ? "You Are Healthy "
                          : "You Are Under Weight",
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              SizedBox(
                height: 20,
              )
            ],
          )),
    );
  }
}
