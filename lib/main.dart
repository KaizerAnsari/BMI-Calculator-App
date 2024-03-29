import 'package:bmicalculator/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      home: SplashScreen()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController =TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blue,
        title: Text('                  BMI Calculator       ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,),),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(

            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w700,
                ),),

                SizedBox(height: 11,),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                      label: Text('Enter your Weight'),
                      prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter your Height (in Feet)'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                  SizedBox(height: 11,),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text('Enter your Height (in Inch)'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 21,),
                ElevatedButton(style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                ), onPressed:(){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();
                  if(wt!="" && ft!="" && inch!=""){
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (ift*12) + iInch;
                      var tCm = tInch*2.54;
                      var tM = tCm/100;
                      var bmi = iwt/(tM*tM);
                      var msg = "";

                      if(bmi>25){
                        msg = "You are OverWeight!!";
                        bgColor = Colors.orange.shade300;
                      }else if(bmi<18){
                        msg = " You are UnderWeight!!";
                        bgColor = Colors.red.shade300;
                      }else{
                        msg = "You Are Healthy!!";
                        bgColor = Colors.green.shade300;
                      }

                      setState(() {
                        result = " $msg  \n Your BMI   =  ${bmi.toStringAsFixed(4)}";
                      });


                  }else{
                    setState(() {
                      result = "Please fill all requirement blank !!";
                    });
                  }

                }, child: Text('Calculate', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),),
                SizedBox(height: 21,),
                  Text(result , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
              ],
            ),
          ),
        ),
      )

    );
  }
}
