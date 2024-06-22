import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: const MyHomePage(
        title: 'BMI Calculator',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var msg = "";

  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Container(
          color: bgColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Container(
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: const Text(
                            'BMI',
                            style: TextStyle(fontSize: 30),
                          ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: wtController,
                      decoration: const InputDecoration(
                        labelText: "Enter your weight in kgs",
                        prefixIcon: Icon(Icons.monitor_weight),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16), // Add some space between widgets
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: ftController,
                            decoration: const InputDecoration(
                              labelText: "Height in Feet",
                              prefixIcon: Icon(Icons.straighten),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(
                            width: 13), // Add some space between the text fields
                        Expanded(
                          child: TextField(
                            controller: inController,
                            decoration: const InputDecoration(
                              labelText: "Inches",
                              prefixIcon: Icon(Icons.straighten),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 20), // Add some space before the button
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20), // Add horizontal padding
                        child: ElevatedButton(
                          onPressed: () {
                            var wt = wtController.text.toString();
                            var ft = ftController.text.toString();
                            var inch = inController.text.toString();
      
                            if (wt != "" && ft != "" && inch != "") {
                              var iWt = int.parse(wt);
                              var iFt = int.parse(ft);
                              var iInch = int.parse(inch);
      
                              var tInch = (iFt * 12) + iInch;
                              var tCm = tInch * 2.54;
                              var tM = tCm / 100;
                              var bmi = iWt / (tM * tM);
      
                              if (bmi > 25) {
                                msg = "You are overweight";
                                bgColor = Colors.orange.shade200;
                              } else if (bmi < 18) {
                                msg = "You are underweight";
                                bgColor = Colors.red.shade200;
                              } else {
                                msg = "You are healthy";
                                bgColor = Colors.green.shade200;
                              }
      
                              setState(() {
                                result = "Your BMI is: ${bmi.toStringAsFixed(2)}";
                              });
                            } else {
                              setState(() {
                                result = "Please fill all the fields";
                              });
                            }
                          },
                          child: const Text('Calculate'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 11), // Add some space after the button
                    Text(result, style: TextStyle(fontSize: 19)),
                    Text(msg, style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
