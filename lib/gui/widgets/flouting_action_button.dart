import 'package:calculator_binary_hexa/gui/calculator.dart';
import 'package:flutter/material.dart';

class FabButton extends StatelessWidget {
  final String option;
  final String heroTag;
  final Color color;
  final Color splashColor;
  const FabButton({
    required this.option,
    required this.heroTag,
    required this.color,
    required this.splashColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final monitorWidth = MediaQuery.of(context).size.width;

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: monitorWidth >= 1248 ? 300.0 : 200,
          height: monitorWidth >= 1248 ? 200 : 150,
          child: FloatingActionButton(
            onPressed: () {
              Future.delayed(const Duration(milliseconds: 90), () {
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
            splashColor: splashColor,
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
