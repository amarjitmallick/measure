import 'package:flutter/material.dart';

class AreaProvider extends ChangeNotifier {
  double _katha = 0.0;
  double _bigha = 0.0;
  double _acre = 0.0;
  double _shotangsho = 0.0;
  double _squareFeet = 0.0;
  double _chotak = 0.0;
  double _ayutangsho = 0.0;
  double _squareGauge = 0.0;
  double _kani = 0.0;
  double _squareMeter = 0.0;
  double _squareChain = 0.0;
  double _squareLink = 0.0;
  double _squareHand = 0.0;
  double _gonda = 0.0;

  double get katha => _katha;
  double get bigha => _bigha;
  double get acre => _acre;
  double get shotangsho => _shotangsho;
  double get squareFeet => _squareFeet;
  double get chotak => _chotak;
  double get ayutangsho => _ayutangsho;
  double get squareGauge => _squareGauge;
  double get kani => _kani;
  double get squareMeter => _squareMeter;
  double get squareChain => _squareChain;
  double get squareLink => _squareLink;
  double get squareHand => _squareHand;
  double get gonda => _gonda;

  final Map<String, TextEditingController> controllers = {
    "Katha": TextEditingController(),
    "Bigha": TextEditingController(),
    "Acre": TextEditingController(),
    "Shotangsho": TextEditingController(),
    "Square Feet": TextEditingController(),
    "Chotak": TextEditingController(),
    "Ayutangsho": TextEditingController(),
    "Square Gauge": TextEditingController(),
    "Kani": TextEditingController(),
    "Square Meter": TextEditingController(),
    "Square Chain": TextEditingController(),
    "Square Link": TextEditingController(),
    "Square Hand": TextEditingController(),
    "Gonda": TextEditingController(),
  };

  Future<void> convertArea(String value, String fromUnit) async {
    double inputValue = double.parse(value);

    Map<String, double> conversionFactors = {
      "Katha": 720.0,
      "Acre": 43636.0,
      "Bigha": 14400.0,
      "Shotangsho": 436.36,
      "Ayutangsho": 4.3636,
      "Chotak": 45.0,
      "Kani": 17280.0,
      "Square Gauge": 9.0,
      "Square Chain": 4363.6,
      "Square Feet": 1.0,
      "Square Hand": 2.25,
      "Square Link": 432.0,
      "Gonda": 2.25,
      "Square Meter": 10.78,
    };

    // Convert the value from the original unit to square feet (base unit)
    double valueInSqFt = inputValue * conversionFactors[fromUnit]!;

    // Convert from square feet to all other units
    _katha = valueInSqFt / conversionFactors["Katha"]!;
    _bigha = valueInSqFt / conversionFactors["Bigha"]!;
    _acre = valueInSqFt / conversionFactors["Acre"]!;
    _shotangsho = valueInSqFt / conversionFactors["Shotangsho"]!;
    _ayutangsho = valueInSqFt / conversionFactors["Ayutangsho"]!;
    _chotak = valueInSqFt / conversionFactors["Chotak"]!;
    _squareFeet = valueInSqFt;
    _squareGauge = valueInSqFt / conversionFactors["Square Gauge"]!;
    _kani = valueInSqFt / conversionFactors["Kani"]!;
    _squareMeter = valueInSqFt / conversionFactors["Square Meter"]!;
    _squareChain = valueInSqFt / conversionFactors["Square Chain"]!;
    _squareLink = valueInSqFt / conversionFactors["Square Link"]!;
    _squareHand = valueInSqFt / conversionFactors["Square Hand"]!;
    _gonda = valueInSqFt / conversionFactors["Gonda"]!;

    // Update controllers, but skip the one matching the fromUnit
    controllers.forEach((unit, controller) {
      if (unit != fromUnit) {
        controller.text = _getConvertedValue(unit).toString();
      }
    });

    notifyListeners();
  }

  double _getConvertedValue(String unit) {
    switch (unit) {
      case "Katha":
        return _katha;
      case "Bigha":
        return _bigha;
      case "Acre":
        return _acre;
      case "Shotangsho":
        return _shotangsho;
      case "Square Feet":
        return _squareFeet;
      case "Chotak":
        return _chotak;
      case "Ayutangsho":
        return _ayutangsho;
      case "Square Gauge":
        return _squareGauge;
      case "Kani":
        return _kani;
      case "Square Meter":
        return _squareMeter;
      case "Square Chain":
        return _squareChain;
      case "Square Link":
        return _squareLink;
      case "Square Hand":
        return _squareHand;
      case "Gonda":
        return _gonda;
      default:
        return 0.0;
    }
  }

  Future<void> convertFromUnit(String value, String unit) async {
    await convertArea(value, unit);
  }

  Future<void> resetAllValues() async {
    controllers.forEach(
      (unit, controller) {
        controller.clear();
      },
    );
  }
}
