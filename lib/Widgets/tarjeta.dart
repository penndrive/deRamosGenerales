import 'package:flutter/material.dart';
import 'package:deramosgenerales/Widgets/popupimage.dart';

class Tarjeta extends StatelessWidget {
  final String rutaImagen, titulo, subtitulo, clave;
  final IconData icon;
  final int likes;
  final bool buy;
  final Color iconcolor;

  Tarjeta(
      {this.clave,
      this.titulo,
      this.subtitulo,
      this.rutaImagen,
      this.iconcolor,
      this.buy,
      this.icon,
      this.likes});
      
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Card(
        elevation: 10.0,
        child: Column(
          children: [
            PopUp(
              ruta: '$clave',
              rutaImagen: rutaImagen,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: iconcolor,
                      borderRadius:
                          BorderRadius.all(const Radius.circular(15.0)),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titulo,
                        /*  style: const TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'mermaid',
                        ), */
                      ),
                      Text(
                        subtitulo,
                        /* style: const TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'bebas-neue',
                          letterSpacing: 1.0,
                          color: const Color(0xFFAAAAAA),
                        ), */
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 2.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white,
                        const Color(0xFFAAAAAA),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                      Text(
                        '$likes',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          
          Divider(),
          
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,10.0),
            child: Row(children: <Widget>[
              Text('Precio:',style: TextStyle(fontFamily: 'fuente1',fontSize: 20.0),),
              Text('*******'), //TODO: Bloc Precio!
              Expanded(child:Container()),
              IconButton(icon:Icon(Icons.shopping_cart),//TODO: Cambiar icono al apretar Parameter buy en comida
              onPressed: null,)//TODO: Agregar comida bloc
            ],),
          )
          ],
          
        ),
      ),
    );
  }
}
