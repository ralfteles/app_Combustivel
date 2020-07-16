import 'package:combustivel/widgets/logo.widgets.dart';
import 'package:combustivel/widgets/submit-form.dart';
import 'package:combustivel/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();
  var _busy = false;
  var _completd = false;
  var _resultText = "Compensa utilizar álcool";
  var _color = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            _completd
                ? Success(
                    result: _resultText,
                    reset: reset,
                  )
                : SubmitForm(
                    alcCtrl: _alcCtrl,
                    gasCtrl: _gasCtrl,
                    submitFunc: calculate,
                    busy: _busy),
          ],
        ),
      ),
    );
  }

  Future calculate() async {
    double alc =
        double.parse(_alcCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gas =
        double.parse(_gasCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;

    double res = alc / gas;

    setState(() {
      _color = Colors.purple;
      _completd = false;
      _busy = true;
    });

    return new Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = "Compensa utilizar gasolina!";
        } else {
          _resultText = "Compensa utilizar álcool";
        }

        _completd = true;
        _busy = false;
      });
    });
  }

  reset() {
    setState(() {
      _alcCtrl = new MoneyMaskedTextController();
      _gasCtrl = new MoneyMaskedTextController();
      _completd = false;
      _busy = false;
      _color = Colors.deepPurple;
    });
  }
}
