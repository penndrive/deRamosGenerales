import 'package:flutter/material.dart';

class Comida{
  Comida(this.name, this.ruta, this.likes, this.descripcion, this.price, this.buy, this.favState, this.porciones,this.key);

  Comida.empty(){
    this.name='';
    this.ruta='';
    this.porciones=0;
    this.likes=0;
    this.buy=false;
    this.favState=false;
    this.price=0;
    this.descripcion='';
    this.key=null;
  }

  String name,ruta,descripcion;
  int likes, price, porciones;
  bool buy,favState;
  ValueKey<String> key;




}