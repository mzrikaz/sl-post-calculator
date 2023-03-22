import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CalculatorForm extends StatefulWidget {
  @override
  _CalculatorFormState createState() => _CalculatorFormState();
}

class _CalculatorFormState extends State<CalculatorForm> {
  bool _registerPost = false;
  final _postTypes = const ['Letter', 'Printed Matter'];
  final _zones = const ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
  final _key = GlobalKey<FormState>();
  var _postTypeController;
  final _weightController = TextEditingController();
  var _zoneController;

  String? _validateWeight(String value) {
    if (value.isEmpty) {
      return "Weight cannot be empty";
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  Future<void>? _calculate(BuildContext context) {
    if (_key.currentState?.validate() ?? false) {
      double shippingCost({required double initialWeight, rates}) {
        var price =
            ((double.tryParse(_weightController.text)! - initialWeight) / 10);
        switch (_zoneController) {
          case "A":
            return rates[0][0] + price * rates[0][1];
            break;
          case "B":
            return rates[1][0] + price * rates[1][1];
            break;
          case "C":
            return rates[2][0] + price * rates[2][1];
            break;
          case "D":
            return rates[3][0] + price * rates[3][1];
            break;
          case "E":
            return rates[4][0] + price * rates[4][1];
            break;
          case "F":
            return rates[5][0] + price * rates[5][1];
            break;
          case "G":
            return rates[6][0] + price * rates[6][1];
            break;
          case "H":
            return rates[7][0] + price * rates[7][1];
            break;
          default:
            return 0.00;
            break;
        }
      }

      final letterRates = [
        [55, 15],
        [60, 15],
        [65, 20],
        [70, 20],
        [75, 25],
        [80, 25],
        [85, 30],
        [110, 40],
      ];

      final printedRates = [
        [50, 15],
        [55, 15],
        [60, 20],
        [65, 20],
        [70, 25],
        [75, 25],
        [80, 30],
        [105, 40],
      ];

      var currentRates;
      if (_postTypeController == "Letter") {
        currentRates = letterRates;
      } else {
        currentRates = printedRates;
      }

      final content = _registerPost
          ? shippingCost(initialWeight: 20, rates: currentRates) + 200
          : shippingCost(initialWeight: 20, rates: currentRates);

      return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            _registerPost ? "Register Post + Stamp Fee" : "Stamp Fee",
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Rs.${content.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: const Text(
                  'OKAY',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _key.currentState!.reset();
                  _weightController.clear();
                  Navigator.of(ctx).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              hintText: "Weight (g)",
            ),
            keyboardType: TextInputType.number,
            controller: _weightController,
            autofocus: false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Register Post'),
              Switch(
                value: _registerPost,
                onChanged: (value) {
                  setState(() {
                    _registerPost = !_registerPost;
                  });
                },
              ),
            ],
          ),
          DropdownButtonFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            hint: const Text('Select Post Type'),
            items: _postTypes.map((String value) {
              return DropdownMenuItem(
                child: Text(value),
                value: value,
              );
            }).toList(),
            validator: (value) =>
                value == null ? "Post type is required" : null,
            onChanged: (value) {
              setState(() {
                _postTypeController = value;
              });
            },
          ),
          DropdownButtonFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            hint: const Text('Select Zone'),
            items: _zones.map((String value) {
              return DropdownMenuItem(
                child: Text(value),
                value: value,
              );
            }).toList(),
            validator: (value) => value == null ? "Zone is required" : null,
            onChanged: (value) {
              _zoneController = value;
            },
          ),
          ElevatedButton(
            child: const Text(
              'CALCULATE',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () => _calculate(context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Developed By:'),
              TextButton(
                child: const Text(
                  'Witsberry (Pvt) Ltd',
                  style: TextStyle(
                    color: Color(0xFFC0001E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  launchUrlString("https://www.witsberry.com");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
