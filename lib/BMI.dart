import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MYBMI extends StatefulWidget {
  const MYBMI({super.key});

  @override
  State<MYBMI> createState() => _MYBMIState();
}

class _MYBMIState extends State<MYBMI> {
  var _weightController = TextEditingController();
  var _heightController = TextEditingController();
double bmi=0;
var msg='';

void calculateBMI() {
  double weight = double.parse(_weightController.text);
  double height = double.parse(_heightController.text);
  // bmi = weight / (height * height);

  if (weight > 0 && height > 0) {
   setState(() {
      bmi = weight / ((height/100) * (height/100) );

           if(bmi>25){
     msg =('OverWeight');
    }else if(bmi>18){
      msg=('You are healthy is Good'); 
    }
    else{
      msg=('Underweight');
    }

   });
  }


}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _weightController,
                decoration:
                    InputDecoration(labelText: ' Enter your Weight (kg)'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _heightController,
                decoration:
                    InputDecoration(labelText: ' Enter your Height in CM '),
                keyboardType: TextInputType.number,
              ),
            
              SizedBox(
                height: 30,
              ),
              Image.network(
                  'https://www.shutterstock.com/image-vector/bmi-body-mass-index-meter-600nw-2313911113.jpg'),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: calculateBMI,
                      
                      child: Text('Results'))),
                      SizedBox(height: 40,),
                      Text('your BMI IS  ${bmi.toStringAsFixed(1)}',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold ),),
                      SizedBox(height: 20,),

                      Text(msg,style: TextStyle(fontSize: 25),)
              
            ],
          ),
        ),
      ),
    );
  }
}
