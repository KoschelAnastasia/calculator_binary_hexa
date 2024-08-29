import 'package:calculator_binary_hexa/gui/calculator.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: Colors.lightGreen[900],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(option: 'Decimal in Binar'),
                Button(option: 'Decimal in Hexa'),
                Button(option: 'Hexa in Binar'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(option: 'Binar in Decimal'),
                Button(option: 'Hexa in Decimal'),
                Button(option: 'Binar in Hexa'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String option;
  const Button({
    required this.option,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final monitorWidth = MediaQuery.of(context).size.width;
    Color color = Colors.lightGreen[900]!;

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Calculator(
                        option: option,
                      )),
            );
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color?>(color),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            fixedSize: WidgetStateProperty.all<Size>(
              Size(monitorWidth >= 1248 ? 300.0 : 200, monitorWidth >= 1248 ? 200 : 150),
            ),
          ),
          child: Text(
            option,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white70,
            ),
          ),
        ));
  }
}
