import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatelessWidget {
  static String id = 'calculator_home' ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  SimpleCalculator({Key key}) : super(key: key);

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {

  String equation = "0";
  String result = "0"; 
  String expression = "";
  double equationFontsize = 30.0 ;
  double resultFontsize = 40.0 ;

  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == "C")
      {
        equation = "0";
        result = "0";
      }
      else if(buttonText == "<=")
      {
        equation = equation.substring(0,equation.length-1);
        if(equation == "")
        equation = "0";
      }
      else if(buttonText == "=")
      {
        expression = equation ;
        // used to solve the mathematical expression with help of dart package we imported
        try{
          Parser p = new Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();  
          result = '${exp.evaluate(EvaluationType.REAL, cm )}';
        }
        catch(e){
          result = "Error";
        }

      }
      else
      {
        if(equation == "0")
        {
          equation = buttonText ;
        }
        else
        {
          equation = equation + buttonText ;
        }
      }
    });
  }

  Widget buildButton(String buttonText, double buttonHeight , Color buttonColor){
    return Container(
      height: MediaQuery.of(context).size.width * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        padding: EdgeInsets.all(15.0),
        onPressed: () => buttonPressed(buttonText), 
        child : Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Calculator"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(context),
        ), 
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(10),
            child: Text(
              equation,
              style: TextStyle(
                fontSize: equationFontsize,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(10),
            child: Text(
              result,
              style: TextStyle(
                fontSize: resultFontsize,
              ),
            ),
          ),
          
          Expanded(
            child: Divider(),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("C",2,Colors.redAccent ),
                        buildButton("<=",2,Colors.blueAccent),
                        buildButton("/",2,Colors.blueAccent),
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("7",2,Colors.black ),
                        buildButton("8",2,Colors.black),
                        buildButton("9",2,Colors.black),
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("4",2,Colors.black ),
                        buildButton("5",2,Colors.black),
                        buildButton("6",2,Colors.black),
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("1",2,Colors.black ),
                        buildButton("2",2,Colors.black),
                        buildButton("3",2,Colors.black),
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton(".",2,Colors.black ),
                        buildButton("0",2,Colors.black),
                        buildButton("00",2,Colors.black),
                      ]
                    ),
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("*",2,Colors.blueAccent),
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("-",2,Colors.blueAccent),
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("+",2,Colors.blueAccent),
                      ]
                    ),
                    TableRow(
                      children: [
                        buildButton("=",4,Colors.redAccent),
                      ]
                    ),
                  ],
                ),

              )
            ],
          )
        ],
      ),
    );
  }
}