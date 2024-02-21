import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Measure',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController meterValueController = TextEditingController();
  TextEditingController feetOfFeetInchValueController = TextEditingController();
  TextEditingController inchOfFeetInchValueController = TextEditingController();
  TextEditingController feetValueController = TextEditingController();
  TextEditingController inchValueController = TextEditingController();

  String convertMetersToFeetOfFeetAndInches(double meters) {
    double feet = meters * 3.28084;
    int wholeFeet = feet.floor();
    return '$wholeFeet';
  }

  String convertMetersToInchesOfFeetAndInches(double meters) {
    double feet = meters * 3.28084;
    int wholeFeet = feet.floor();
    double remainingInches = (feet - wholeFeet) * 12;
    remainingInches = double.parse(remainingInches.toStringAsFixed(4));
    return '$remainingInches';
  }

  String convertFeetAndInchesToMeters(int feet, double inches) {
    double meters = feet * 0.3048 + inches * 0.0254;
    return meters.toStringAsFixed(5);
  }

  String convertMetersToFeet(double meters) {
    double feet = meters * 3.28084;
    return feet.toStringAsFixed(5);
  }

  String convertFeetToMeters(double feet) {
    double meters = feet * 0.3048;
    return meters.toStringAsFixed(5);
  }

  String convertMetersToInches(double meters) {
    double inches = meters * 3.28084 * 12;
    return inches.toStringAsFixed(5);
  }

  String convertInchesToMeters(double inches) {
    double meters = inches * 0.0254;
    return meters.toStringAsFixed(5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "",
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Text(
              "Mtr",
              style: TextStyle(fontSize: 30),
            ),
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.lightBlueAccent.withOpacity(0.2),
              ),
              child: TextField(
                controller: meterValueController,
                style: const TextStyle(fontSize: 30),
                onChanged: (value) {
                  debugPrint("Value: $value");
                  setState(
                    () {
                      feetValueController.text = value.isNotEmpty ? convertMetersToFeet(double.parse(value)) : "0";
                      feetOfFeetInchValueController.text =
                          value.isNotEmpty ? convertMetersToFeetOfFeetAndInches(double.parse(value)) : "0";
                      inchOfFeetInchValueController.text =
                          value.isNotEmpty ? convertMetersToInchesOfFeetAndInches(double.parse(value)) : "0";

                      inchValueController.text = value.isNotEmpty ? convertMetersToInches(double.parse(value)) : "0";
                    },
                  );
                },
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              "Ft inch",
              style: TextStyle(fontSize: 30),
            ),
            subtitle: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.lightBlueAccent.withOpacity(0.2),
                    ),
                    child: TextField(
                      controller: feetOfFeetInchValueController,
                      style: const TextStyle(fontSize: 30),
                      onChanged: (value) {
                        setState(
                          () {
                            meterValueController.text = value.isNotEmpty
                                ? convertFeetAndInchesToMeters(
                                    int.parse(value),
                                    double.parse(inchOfFeetInchValueController.text.isNotEmpty
                                        ? inchOfFeetInchValueController.text
                                        : "0"))
                                : "0";
                            feetValueController.text =
                                value.isNotEmpty ? convertMetersToFeet(double.parse(meterValueController.text)) : "0";
                            inchValueController.text =
                                value.isNotEmpty ? convertMetersToInches(double.parse(meterValueController.text)) : "0";
                          },
                        );
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                        signed: false,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "Ft",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.lightBlueAccent.withOpacity(0.2),
                    ),
                    child: TextField(
                      controller: inchOfFeetInchValueController,
                      style: const TextStyle(fontSize: 30),
                      onChanged: (value) {
                        setState(
                          () {
                            meterValueController.text = value.isNotEmpty
                                ? convertFeetAndInchesToMeters(
                                    int.parse(feetOfFeetInchValueController.text.isNotEmpty
                                        ? feetOfFeetInchValueController.text
                                        : "0"),
                                    double.parse(value),
                                  )
                                : "0";
                            feetValueController.text =
                                value.isNotEmpty ? convertMetersToFeet(double.parse(meterValueController.text)) : "0";
                            inchValueController.text =
                                value.isNotEmpty ? convertMetersToInches(double.parse(meterValueController.text)) : "0";
                          },
                        );
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                        signed: false,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "inch",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text(
              "Ft",
              style: TextStyle(fontSize: 30),
            ),
            subtitle: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.lightBlueAccent.withOpacity(0.2),
              ),
              child: TextField(
                controller: feetValueController,
                style: const TextStyle(fontSize: 30),
                onChanged: (value) {
                  debugPrint("Value: $value");
                  setState(
                    () {
                      meterValueController.text = value.isNotEmpty ? convertFeetToMeters(double.parse(value)) : "0";
                      feetOfFeetInchValueController.text =
                          value.isNotEmpty ? double.parse(value).floor().toString() : "0";
                      inchOfFeetInchValueController.text = value.isNotEmpty
                          ? ((double.parse(value) - double.parse(value).floor()) * 12).toString()
                          : "0";
                      inchValueController.text =
                          value.isNotEmpty ? convertMetersToInches(double.parse(meterValueController.text)) : "0";
                    },
                  );
                },
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              "Inch",
              style: TextStyle(fontSize: 30),
            ),
            subtitle: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.lightBlueAccent.withOpacity(0.2),
              ),
              child: TextField(
                controller: inchValueController,
                style: const TextStyle(fontSize: 30),
                onChanged: (value) {
                  setState(
                    () {
                      meterValueController.text = value.isNotEmpty ? convertInchesToMeters(double.parse(value)) : "0";
                      feetOfFeetInchValueController.text =
                          value.isNotEmpty ? double.parse(feetValueController.text).floor().toString() : "0";
                      inchOfFeetInchValueController.text = value.isNotEmpty
                          ? ((double.parse(feetValueController.text) - double.parse(feetValueController.text).floor()) *
                                  12)
                              .toString()
                          : "0";
                      feetValueController.text =
                          value.isNotEmpty ? convertMetersToFeet(double.parse(meterValueController.text)) : "0";
                    },
                  );
                },
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
