import 'package:calculator_binary_hexa/classes/button_properties.dart';
import 'package:calculator_binary_hexa/gui/widgets/flouting_action_button.dart';
import 'package:flutter/material.dart';

//Class that creates a line of FabButtons based on the properties of the buttons
class ButtonPropertiesLine extends StatelessWidget {
  final List<BottonProperties> buttonsPropertiesList;
  const ButtonPropertiesLine({
    required this.buttonsPropertiesList,
    super.key,
  });
//Named Constructors that creates a line of FabButtons based on the properties of the buttons
  ButtonPropertiesLine.firstLine()
      : buttonsPropertiesList = [
          BottonProperties(
            color: Colors.lightGreen[900]!,
            splashColor: Colors.orange[900]!,
            option: 'Decimal in Binar',
            heroTag: 'DiB',
          ),
          BottonProperties(
            color: Colors.lightGreen[900]!,
            splashColor: Colors.orange[900]!,
            option: 'Decimal in Hexa',
            heroTag: 'DiH',
          ),
          BottonProperties(
            color: Colors.lightGreen[900]!,
            splashColor: Colors.orange[900]!,
            option: 'Hexa in Binar',
            heroTag: 'HiB',
          ),
        ];

  ButtonPropertiesLine.secondLine()
      : buttonsPropertiesList = [
          BottonProperties(
            color: Colors.lightGreen[900]!,
            splashColor: Colors.orange[900]!,
            option: 'Binar in Decimal',
            heroTag: 'BiD',
          ),
          BottonProperties(
            color: Colors.lightGreen[900]!,
            splashColor: Colors.orange[900]!,
            option: 'Hexa in Decimal',
            heroTag: 'HiD',
          ),
          BottonProperties(
            color: Colors.lightGreen[900]!,
            splashColor: Colors.orange[900]!,
            option: 'Binar in Hexa',
            heroTag: 'BiH',
          ),
        ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttonsPropertiesList
          .map((BottonProperties buttonProperties) => FabButton(
                option: buttonProperties.option,
                heroTag: buttonProperties.heroTag,
                color: buttonProperties.color,
                splashColor: buttonProperties.splashColor,
              ))
          .toList(),
    );
  }
}
