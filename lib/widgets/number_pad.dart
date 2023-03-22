import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sl_post_air_mail_calculator/providers/country_provider.dart';

class NumberPad extends StatefulWidget {
  const NumberPad({
    Key? key,
  }) : super(key: key);

  @override
  State<NumberPad> createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  String _initialValue = "0";

  void addDigit(String digit) {
    setState(() {
      if (_initialValue.length <= 4) {
        if (_initialValue == "0") {
          _initialValue = digit;
        } else {
          _initialValue += digit;
        }
        calculate(int.parse(_initialValue));
      }
    });
  }

  void backspace() {
    setState(() {
      if (_initialValue.length == 1) {
        _initialValue = "0";
      } else {
        _initialValue = _initialValue.substring(0, _initialValue.length - 1);
      }

      calculate(int.parse(_initialValue));
    });
  }

  void calculate(int weight) {
    final provider = Provider.of<CountryProvider>(context, listen: false);
    provider.calculate(weight);
  }

  void clear() {
    setState(() {
      _initialValue = "0";
    });
    final provider = Provider.of<CountryProvider>(context, listen: false);
    provider.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${_initialValue}g",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CalcButton(
              child: Text("1"),
              action: () => addDigit("1"),
            ),
            CalcButton(
              child: Text("2"),
              action: () => addDigit("2"),
            ),
            CalcButton(
              child: Text("3"),
              action: () => addDigit("3"),
            ),
            CalcButton(
              child: Text("4"),
              action: () => addDigit("4"),
            ),
            CalcButton(
              child: Text("5"),
              action: () => addDigit("5"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CalcButton(
              child: Text("6"),
              action: () => addDigit("6"),
            ),
            CalcButton(
              child: Text("7"),
              action: () => addDigit("7"),
            ),
            CalcButton(
              child: Text("8"),
              action: () => addDigit("8"),
            ),
            CalcButton(
              child: Text("9"),
              action: () => addDigit("9"),
            ),
            CalcButton(
              child: Text("0"),
              action: () => addDigit("0"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CalcButton(
              child: Icon(Icons.backspace),
              action: backspace,
            ),
            SizedBox(width: 10),
            CalcButton(
              child: Icon(Icons.delete),
              action: clear,
            ),
          ],
        ),
      ],
    );
  }
}

class CalcButton extends StatelessWidget {
  final Widget child;
  final VoidCallback action;
  const CalcButton({
    Key? key,
    required this.child,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => action(),
      child: child,
      style: ElevatedButton.styleFrom(),
    );
  }
}
