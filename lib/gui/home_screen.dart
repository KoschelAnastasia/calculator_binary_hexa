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
                Button(
                  option: 'Decimal in Binar',
                  heroTag: 'DiB',
                ),
                Button(
                  option: 'Decimal in Hexa',
                  heroTag: 'DiH',
                ),
                Button(
                  option: 'Hexa in Binar',
                  heroTag: 'HiB',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  option: 'Binar in Decimal',
                  heroTag: 'BiD',
                ),
                Button(
                  option: 'Hexa in Decimal',
                  heroTag: 'HiD',
                ),
                Button(
                  option: 'Binar in Hexa',
                  heroTag: 'BiH',
                ),
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
  final String heroTag;
  const Button({
    required this.option,
    required this.heroTag,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final monitorWidth = MediaQuery.of(context).size.width;
    Color color = Colors.lightGreen[900]!;

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: monitorWidth >= 1248 ? 300.0 : 200,
          height: monitorWidth >= 1248 ? 200 : 150,
          child: FloatingActionButton(
            onPressed: () {
              Future.delayed(const Duration(milliseconds: 100), () {
                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Calculator(
                              option: option,
                            )),
                  );
                }
              });
            },
            splashColor: Colors.orange[900],
            heroTag: heroTag,
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Text(
              option,
              style: const TextStyle(
                fontSize: 32,
                color: Colors.white70,
              ),
            ),
          ),
        ));
  }
}
