import 'package:calculator_binary_hexa/logic/converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  late String option;

  Calculator({
    super.key,
    required this.option,
  });

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic result = '';
  dynamic intermidiateResult;
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final monitorWidth = MediaQuery.of(context).size.width;
    print('monitorWidth: $monitorWidth');
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      appBar: AppBar(
        title: Text(
          widget.option == "Binar in Decimal"
              ? 'Binar in Decimal'
              : widget.option == 'Decimal in Binar'
                  ? 'Decimal in Binar'
                  : widget.option == 'Decimal in Hexa'
                      ? 'Decimal in Hexa'
                      : widget.option == 'Hexa in Decimal'
                          ? 'Hexa in Decimal'
                          : widget.option == 'Binar in Hexa'
                              ? 'Binar in Hexa'
                              : 'Hexa in Binar',
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: Colors.lightGreen[900],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: monitorWidth >= 1248 ? 100 : 60),
                child: TextFormField(
                  inputFormatters: [
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      final pattern = _getPattern();
                      if (pattern.hasMatch(newValue.text) || newValue.text.isEmpty) {
                        return newValue;
                      }
                      return oldValue;
                    }),
                  ],
                  maxLength: widget.option == 'Decimal in Binar' || widget.option == 'Decimal in Hexa'
                      ? 18
                      : widget.option == 'Hexa in Decimal'
                          ? 15
                          : widget.option == 'Hexa in Binar'
                              ? 20
                              : 19,
                  controller: inputController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.lightGreen[900]!,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.lightGreen[900]!,
                        width: 2,
                      ),
                    ),
                    labelText: widget.option == 'Decimal in Binar'
                        ? 'Bitte geben Sie ihre Dezimalzahl ein'
                        : widget.option == 'Binar in Decimal'
                            ? 'Bitte geben Sie ihre Binärzahl ein (0-1)'
                            : widget.option == 'Decimal in Hexa'
                                ? 'Bitte geben Sie ihre Dezimalzahl ein'
                                : widget.option == 'Hexa in Decimal'
                                    ? 'Bitte geben Sie ihre Hexadezimalzahl ein (0-9, A-F)'
                                    : widget.option == 'Binar in Hexa'
                                        ? 'Bitte geben Sie ihre Binärzahl ein (0-1)'
                                        : 'Bitte geben Sie ihre Hexadezimalzahl ein (0-9, A-F)',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Bitte geben Sie eine Zahl ein';
                    }
                    return null; // Add this line to return null if none of the conditions are met
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: monitorWidth >= 1550
                        ? 500
                        : monitorWidth <= 1200
                            ? 100
                            : 300,
                    vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color?>(Colors.lightGreen[900]),
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Berechnen',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white70,
                          ),
                        ),
                        onPressed: () {
                          _onPressed();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: ElevatedButton(
                          onPressed: () {
                            _onSwitch();
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color?>(Colors.lightGreen[900]),
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            minimumSize: WidgetStateProperty.all<Size>(
                              const Size(220, 54),
                            ),
                          ),
                          child: const Icon(
                            Icons.swap_vertical_circle_rounded,
                            color: Colors.white70,
                            size: 40,
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: monitorWidth >= 1248 ? 100 : 60),
                child: TextField(
                  controller: TextEditingController(text: result.toString()),
                  enabled: false,
                  readOnly: true,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.lightGreen[900]!,
                          width: 2,
                        ),
                      ),
                      labelText: widget.option == 'Binar in Decimal' || widget.option == 'Hexa in Decimal'
                          ? 'Dezimalzahl'
                          : widget.option == 'Decimal in Hexa' || widget.option == 'Binar in Hexa'
                              ? 'Hexadezimalzahl'
                              : 'Binarzahl',
                      labelStyle: const TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Method to return the pattern based on the selected option
  RegExp _getPattern() {
    RegExp binarPattern = RegExp(r'^[01]+$');
    RegExp hexaPattern = RegExp(r'^[0-9A-Fa-f]+$');
    RegExp decimalPattern = RegExp(r'^[0-9]+$');
    switch (widget.option) {
      case 'Binar in Decimal':
      case 'Binar in Hexa':
        return binarPattern;
      case 'Hexa in Decimal':
      case 'Hexa in Binar':
        return hexaPattern;
      case 'Dezimal in Binar':
      case 'Dezimal in Hexa':
        return decimalPattern;
      default:
        return decimalPattern;
    }
  }

  void _onSwitch() {
    inputController.clear();
    result = '';
    if (widget.option == 'Binar in Decimal') {
      setState(() {
        widget.option = 'Decimal in Binar';
      });
    } else if (widget.option == 'Decimal in Binar') {
      setState(() {
        widget.option = 'Binar in Decimal';
      });
    } else if (widget.option == 'Decimal in Hexa') {
      setState(() {
        widget.option = 'Hexa in Decimal';
      });
    } else if (widget.option == 'Hexa in Decimal') {
      setState(() {
        widget.option = 'Decimal in Hexa';
      });
    } else if (widget.option == 'Binar in Hexa') {
      setState(() {
        widget.option = 'Hexa in Binar';
      });
    } else if (widget.option == 'Hexa in Binar') {
      setState(() {
        widget.option = 'Binar in Hexa';
      });
    }
  }

  void _onPressed() {
    // Check if the inputController is empty
    if (inputController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Bitte geben Sie eine Zahl ein'),
          backgroundColor: Colors.red[900]!,
        ),
      );
    }
    // If Decimal in Binar is selected, convert the decimal to binary
    else if (widget.option == 'Decimal in Binar') {
      setState(() {
        result = Converter.calculateDecimalToBinary(int.parse(inputController.text));
      });
    }
    // If Binar in Decimal is selected, convert the binary to decimal
    else if (widget.option == 'Binar in Decimal') {
      setState(() {
        result = Converter.calculateBinaryToDecimal(int.parse(inputController.text));
      });
    }
    // If Decimal in Hexa is selected, convert the decimal to hexadecimal
    else if (widget.option == 'Decimal in Hexa') {
      setState(() {
        result = Converter.calculateDecimalToHexa(int.parse(inputController.text));
      });
    }
    // If Hexa in Decimal is selected, convert the hexadecimal to decimal
    else if (widget.option == 'Hexa in Decimal') {
      setState(() {
        result = Converter.calculateHexaToDecimal(inputController.text);
      });
    }
    // If Binar in Hexa is selected, convert the binary to decimal and then convert the decimal to hexadecimal
    else if (widget.option == 'Binar in Hexa') {
      setState(() {
        intermidiateResult = Converter.calculateBinaryToDecimal(int.parse(inputController.text));
        result = Converter.calculateDecimalToHexa(int.parse(intermidiateResult.toString()));
      });
    }
    // If Hexa in Binar is selected, convert the hexadecimal to decimal and then convert the decimal to binary
    else if (widget.option == 'Hexa in Binar') {
      setState(() {
        intermidiateResult = Converter.calculateHexaToDecimal(inputController.text);
        result = Converter.calculateDecimalToBinary(int.parse(intermidiateResult.toString()));
      });
    }
  }
}
