import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:measure/providers/area_provider.dart';
import 'package:measure/theme/text_styles.dart';
import 'package:measure/theme/theme.dart';
import 'package:measure/utils/strings.dart';
import 'package:provider/provider.dart';

class AreaConversionScreen extends StatefulWidget {
  const AreaConversionScreen({super.key});

  @override
  State<AreaConversionScreen> createState() => _AreaConversionScreenState();
}

class _AreaConversionScreenState extends State<AreaConversionScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AreaProvider>(
      builder: (BuildContext context, areaProvider, Widget? child) {
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            const Text(MeasureStrings.instructionText),
            AreaInputField(
              label: 'Katha',
              controller: areaProvider.controllers["Katha"]!,
              onChanged: (value) {
                if (value!.isNotEmpty) {
                  areaProvider.convertFromUnit(value, "Katha");
                } else {
                  areaProvider.convertFromUnit("0", "Katha");
                }
              },
            ),
            AreaInputField(
              label: 'Square Feet',
              controller: areaProvider.controllers["Square Feet"]!,
              onChanged: (value) {
                if (value!.isNotEmpty) {
                  areaProvider.convertFromUnit(value, "Square Feet");
                } else {
                  areaProvider.convertFromUnit("0", "Square Feet");
                }
              },
            ),
            AreaInputField(
              label: 'Square Gauge',
              controller: areaProvider.controllers["Square Gauge"]!,
              onChanged: (value) {
                if (value!.isNotEmpty) {
                  areaProvider.convertFromUnit(value, "Square Gauge");
                } else {
                  areaProvider.convertFromUnit("0", "Square Gauge");
                }
              },
            ),
            AreaInputField(
              label: 'Shotangsho',
              controller: areaProvider.controllers["Shotangsho"]!,
              onChanged: (value) {
                if (value!.isNotEmpty) {
                  areaProvider.convertFromUnit(value, "Shotangsho");
                } else {
                  areaProvider.convertFromUnit("0", "Shotangsho");
                }
              },
            ),
            AreaInputField(
              label: 'Chotak',
              controller: areaProvider.controllers["Chotak"]!,
              onChanged: (value) {
                if (value!.isNotEmpty) {
                  areaProvider.convertFromUnit(value, "Chotak");
                } else {
                  areaProvider.convertFromUnit("0", "Chotak");
                }
              },
            ),
            AreaInputField(
              label: 'Acre',
              controller: areaProvider.controllers["Acre"]!,
              onChanged: (value) {
                if (value!.isNotEmpty) {
                  areaProvider.convertFromUnit(value, "Acre");
                } else {
                  areaProvider.convertFromUnit("0", "Acre");
                }
              },
            ),
            AreaInputField(
              label: 'Bigha',
              controller: areaProvider.controllers["Bigha"]!,
              onChanged: (value) {
                if (value!.isNotEmpty) {
                  areaProvider.convertFromUnit(value, "Bigha");
                } else {
                  areaProvider.convertFromUnit("0", "Bigha");
                }
              },
            ),
            AreaInputField(
              label: 'Square Chain',
              controller: areaProvider.controllers["Square Chain"]!,
              onChanged: (value) {
                if (value!.isNotEmpty) {
                  areaProvider.convertFromUnit(value, "Square Chain");
                } else {
                  areaProvider.convertFromUnit("0", "Square Chain");
                }
              },
            ),
            AreaInputField(
              label: 'Square Meter',
              controller: areaProvider.controllers["Square Meter"]!,
              onChanged: (value) {
                if (value!.isNotEmpty) {
                  areaProvider.convertFromUnit(value, "Square Meter");
                } else {
                  areaProvider.convertFromUnit("0", "Square Meter");
                }
              },
            ),
            AreaInputField(
              label: 'Square Hand',
              controller: areaProvider.controllers["Square Hand"]!,
              onChanged: (value) {
                if (value!.isNotEmpty) {
                  areaProvider.convertFromUnit(value, "Square Hand");
                } else {
                  areaProvider.convertFromUnit("0", "Square Hand");
                }
              },
            ),
            AreaInputField(
              label: 'Ayutangsho',
              controller: areaProvider.controllers["Ayutangsho"]!,
              onChanged: (value) {
                if (value!.isNotEmpty) {
                  areaProvider.convertFromUnit(value, "Ayutangsho");
                } else {
                  areaProvider.convertFromUnit("0", "Ayutangsho");
                }
              },
            ),
            AreaInputField(
              label: 'Gonda',
              controller: areaProvider.controllers["Gonda"]!,
              onChanged: (value) {
                if (value!.isNotEmpty) {
                  areaProvider.convertFromUnit(value, "Gonda");
                } else {
                  areaProvider.convertFromUnit("0", "Gonda");
                }
              },
            ),
            AreaInputField(
              label: 'Kani',
              controller: areaProvider.controllers["Kani"]!,
              onChanged: (value) {
                if (value!.isNotEmpty) {
                  areaProvider.convertFromUnit(value, "Kani");
                } else {
                  areaProvider.convertFromUnit("0", "Kani");
                }
              },
            ),
            AreaInputField(
              label: 'Square Link',
              controller: areaProvider.controllers["Square Link"]!,
              onChanged: (value) {
                if (value!.isNotEmpty) {
                  areaProvider.convertFromUnit(value, "Square Link");
                } else {
                  areaProvider.convertFromUnit("0", "Square Link");
                }
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: TextButton(
                onPressed: areaProvider.resetAllValues,
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
      },
    );
  }
}

class AreaInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function(String?) onChanged;

  const AreaInputField({
    super.key,
    required this.label,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: textFieldInputDecoration(label, "Enter value in $label"),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        controller: controller,
        onChanged: onChanged,
      ),
    );
  }
}
