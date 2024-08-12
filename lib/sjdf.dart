import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BMICalculatorHomePage(),
    );
  }
}

class BMICalculatorHomePage extends StatefulWidget {
  @override
  _BMICalculatorHomePageState createState() => _BMICalculatorHomePageState();
}

class _BMICalculatorHomePageState extends State<BMICalculatorHomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmi = 0;
  var msg='';

  void _calculateBMI() {
    final double height = double.tryParse(_heightController.text) ?? 0;
    final double weight = double.tryParse(_weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      setState(() {
        _bmi = weight / ((height / 100) * (height / 100));
          if(_bmi>25){
     msg =('OverWeight');
    }else if(_bmi>18){
      msg=('You are healthy is Good'); 
    }
    else{
      msg=('Underweight');
    }
      });
    } else {
      setState(() {
        _bmi = 0;
        // msg='Please enter height and weight';
      });
    }

  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20),
            Text(
              _bmi > 0 ? 'Your BMI is ${_bmi.toStringAsFixed(2)}' : 'Please enter your height and weight',
              style: TextStyle(fontSize: 24),
            ),
            Text(msg,style: TextStyle(fontSize: 24),)
          ],
        ),
      ),
    );
  }
}
