import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
var result = "";
  Widget button(var text){
    return ElevatedButton(onPressed: () {
      setState((){
        result = result + text;
      });
    }, child: Text(text));
  }

  clear(){
    setState((){
      result = "";
    }
    );
  }

  output(){
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL,cm);

    setState(() {
      result = eval.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(result,style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          button("1"),
          button("2"),
          button("3"),
          button("4"),
        ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          button("5"),
          button("6"),
          button("7"),
          button("8"),
        ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          button("9"),
          button("0"),
          button("+"),
          button("-"),
        ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          button("/"),
          button("*"),
          ElevatedButton(onPressed: output, child: Text("=")),
          ElevatedButton(onPressed: clear, child: Text("clear")),
        ],)
      ],)
      ,)
    );
  }
}