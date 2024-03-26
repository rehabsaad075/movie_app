import 'package:flutter/material.dart';

void navigationPushFunction({required context,required Widget screen}){
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context){
        return screen;
      }));
}