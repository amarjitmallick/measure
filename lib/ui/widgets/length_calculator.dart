import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:measure/theme/text_styles.dart';
import 'package:measure/theme/theme.dart';
import 'package:measure/utils/strings.dart';

class LengthCalculator extends StatefulWidget {
  const LengthCalculator({super.key});

  @override
  State<LengthCalculator> createState() => _LengthCalculatorState();
}

class _LengthCalculatorState extends State<LengthCalculator> {
  TextEditingController meterValueController = TextEditingController();
  TextEditingController feetOfFeetInchValueController = TextEditingController();
  TextEditingController inchOfFeetInchValueController = TextEditingController();
  TextEditingController feetValueController = TextEditingController();
  TextEditingController inchValueController = TextEditingController();

  String numberPattern = r'[0-9]+(\.[0-9]{0,2})?';

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

  void resetAllValues() {
    meterValueController.clear();
    feetOfFeetInchValueController.clear();
    inchOfFeetInchValueController.clear();
    feetValueController.clear();
    inchValueController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      children: [
        const Text(MeasureStrings.instructionText),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: TextFormField(
            controller: meterValueController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(numberPattern)),
            ],
            decoration: textFieldInputDecoration("Meter", "Enter value in meter"),
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
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
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: feetOfFeetInchValueController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(numberPattern)),
                ],
                decoration: textFieldInputDecoration("Feet", "Enter value in Feet"),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
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
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: TextFormField(
                controller: inchOfFeetInchValueController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(numberPattern)),
                ],
                decoration: textFieldInputDecoration("Inch", "Enter value in inch"),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
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
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: TextFormField(
            controller: feetValueController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(numberPattern)),
            ],
            decoration: textFieldInputDecoration("Feet", "Enter value in Feet"),
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
            onChanged: (value) {
              debugPrint("Value: $value");
              setState(
                () {
                  meterValueController.text = value.isNotEmpty ? convertFeetToMeters(double.parse(value)) : "0";
                  feetOfFeetInchValueController.text = value.isNotEmpty ? double.parse(value).floor().toString() : "0";
                  inchOfFeetInchValueController.text =
                      value.isNotEmpty ? ((double.parse(value) - double.parse(value).floor()) * 12).toString() : "0";
                  inchValueController.text =
                      value.isNotEmpty ? convertMetersToInches(double.parse(meterValueController.text)) : "0";
                },
              );
            },
          ),
        ),
        TextFormField(
          controller: inchValueController,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(numberPattern)),
          ],
          decoration: textFieldInputDecoration("Inch", "Enter value in inch"),
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
            signed: false,
          ),
          onChanged: (value) {
            setState(
              () {
                meterValueController.text = value.isNotEmpty ? convertInchesToMeters(double.parse(value)) : "0";
                feetOfFeetInchValueController.text =
                    value.isNotEmpty ? double.parse(feetValueController.text).floor().toString() : "0";
                inchOfFeetInchValueController.text = value.isNotEmpty
                    ? ((double.parse(feetValueController.text) - double.parse(feetValueController.text).floor()) * 12)
                        .toString()
                    : "0";
                feetValueController.text =
                    value.isNotEmpty ? convertMetersToFeet(double.parse(meterValueController.text)) : "0";
              },
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: TextButton(
            onPressed: resetAllValues,
            style: TextButton.styleFrom(
              backgroundColor: MeasureTheme.primaryButtonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text(
                "Reset all values",
                style: TextStyles.primaryButtonTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
