import 'dart:math';

abstract class Converter {
  static String calculateDecimalToBinary(int dezimal) {
    int divider = 2;
    String binary = '';

    do {
      int rest = dezimal % divider;
      int quotient = dezimal ~/ divider;
      dezimal = quotient;
      binary = rest.toString() + binary;
    } while (dezimal != 0);
    return binary;
  }

  static int calculateBinaryToDecimal(int binary) {
    int dezimal = 0;
    int lenght = binary.toString().length;
    int n = lenght - 1;

    for (int i = 0; i < lenght; i++) {
      String binaryString = binary.toString();
      String binaryChar = binaryString[i];
      if (binaryChar == '1') {
        int exponent = pow(2, n).toInt();
        n--;
        dezimal = dezimal + exponent;
      } else if (binaryChar == '0') {
        n--;
      } else {
        print('Ungültige Eingabe');
      }
    }
    return dezimal;
  }

  static int calculateHexaToDecimal(String hexa) {
    int dezimal = 0;
    int lenght = hexa.length;
    String hexaString = '0123456789ABCDEF';
    int n = lenght - 1;

    for (int i = 0; i < lenght; i++) {
      int charVelue = hexaString.indexOf(hexa[i]);
      int exponent = pow(16, n).toInt();
      dezimal = dezimal + charVelue * exponent;
      n--;
    }
    return dezimal;
  }

  static String calculateDecimalToHexa(int dezimal) {
    int divider = 16;
    String hex = '';
    String hexaString = '0123456789ABCDEF';

    do {
      int rest = dezimal % divider;
      String hexChar = hexaString[rest];
      int quotient = dezimal ~/ divider;
      dezimal = quotient;
      hex = hexChar + hex;
    } while (dezimal != 0);
    return hex;
  }
}
