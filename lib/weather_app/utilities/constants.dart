import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle (
  fontFamily: 'Spartan MB',
  fontSize: 50.0 ,
);

const kMessageTextStyle = TextStyle (
  fontFamily: 'Spartan MB',
  fontSize: 60.0 ,
  fontStyle: FontStyle.italic,
);

const kButtonTextStyle = TextStyle (
  backgroundColor: Colors.black,
  fontFamily: 'Spartan MB',
  fontSize: 30.0 ,
);

const kConditionTextStyle = TextStyle (
  fontFamily: 'Spartan MB',
  fontSize: 100.0 ,
);

const kTextFieldInput = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: "Enter City Name",
  hintStyle: TextStyle(
    color: Colors.black,
  ),
);