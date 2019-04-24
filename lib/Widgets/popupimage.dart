import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  final String rutaImagen;
  final String ruta;

  const PopUp({Key key, this.rutaImagen, this.ruta}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextStyle tiempos = TextStyle(
        fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'fuente1');
    return InkWell(
        child: Hero(
          tag: ruta,
          child: Image.asset(
              rutaImagen,
              width: double.infinity,
              height: 150.0,
              fit: BoxFit.cover),
        ),
        onTap: () {
          Navigator.of(context).push(new PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) {
                return new Material(
                    color: Colors.black38,
                    child: new Container(
                      padding: const EdgeInsets.all(30.0),
                      child: new InkWell(
                        child: new Hero(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Image.asset(rutaImagen,
                                        width: double.infinity,
                                        height: 150.0,
                                        fit: BoxFit.cover),
                                    new Text(
                                      'Nombre de la comida',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    new Divider(),
                                    new Row(
                                      children: <Widget>[
                                        new Icon(
                                          Icons.timer,
                                          size: 50.0,
                                        ),
                                        //     Spacer(),
                                        new Text('10" Prep', style: tiempos),
                                        //   Spacer(),
                                        new Text(
                                          '50" Coc',
                                          style: tiempos,
                                        ),
                                        //   Spacer(),
                                        new Text(
                                          '1 H Listo',
                                          style: tiempos,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: new Text(
                                        'Descripción de la comida, historia, comentarios y anecdotas interesantes.',
                                        style: tiempos,
                                      ),
                                    )
                                  ]),
                            ),
                            color: Colors.white,
                          ),
                          tag: ruta,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ));
              }));
        } //fin on tap
        );
  }
}
