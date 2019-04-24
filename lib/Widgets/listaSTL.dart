import 'package:flutter/material.dart';
import 'package:deramosgenerales/Widgets/tarjeta.dart';

class Lista  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: <Widget>[
          Tarjeta(
            clave: '1',
            titulo: 'Comida',
            subtitulo: 'Subtitulo de la comida',
            icon: Icons.fastfood,
            iconcolor: Colors.amberAccent,
            rutaImagen: 'assets/tarjeta1.jpeg',
            likes: 12,
            buy: false,
          ),
          Tarjeta(
            clave: '2',
            titulo: 'Comida',
            subtitulo: 'Subtitulo de la comida',
            icon: Icons.fastfood,
            iconcolor: Colors.amberAccent,
            rutaImagen: 'assets/tarjeta2.jpg',
            likes: 12,
            buy: false,
          ),
          Tarjeta(
            clave: '3',
            titulo: 'Comida',
            subtitulo: 'Subtitulo de la comida',
            icon: Icons.fastfood,
            iconcolor: Colors.amberAccent,
            rutaImagen: 'assets/tarjeta1.jpeg',
            likes: 12,
            buy: false,
          ),
          Tarjeta(
            clave: '4',
            titulo: 'Comida',
            subtitulo: 'Subtitulo de la comida',
            icon: Icons.fastfood,
            iconcolor: Colors.amberAccent,
            rutaImagen: 'assets/tarjeta2.jpg',
            likes: 12,
            buy: false,
          ),
        ],
      );
  }
}
